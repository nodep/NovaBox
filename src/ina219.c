#include <stdbool.h>
#include <stdio.h>
#include <stdint.h>

#include <util/delay.h>

#include "avrdbg.h"
#include "twi.h"
#include "ina219.h"

// the TWI address the INA219 is on
#define INA_ADDRESS			0b1000101

#define ADDR_WRITE	((INA_ADDRESS << 1) | 0)
#define ADDR_READ	((INA_ADDRESS << 1) | 1)

// registers of the INA219
#define REG_CONFIGURATION	0
#define REG_SHUNT_VOLTAGE	1
#define REG_BUS_VOLTAGE		2
#define REG_POWER			3
#define REG_CURRENT			4
#define REG_CALIBRATION		5

float current_lsb = 0;
float power_lsb = 0;

void ina_write(const uint8_t reg, const uint16_t val)
{
	const uint8_t hi = (val >> 8);
	const uint8_t lo = (val & 0xff);
	
	twi_start();			// select the register
	twi_write(ADDR_WRITE);
	twi_write(reg);			// the register address
	twi_write(hi);			// the high byte
	twi_write(lo);			// the low byte
	twi_stop();
}

uint16_t ina_read(const uint8_t reg)
{
	twi_start();			// select the register
	twi_write(ADDR_WRITE);
	twi_write(reg);
    
	twi_start();			// repeated start
	twi_write(ADDR_READ);
	const uint8_t hi = twi_read(true);
	const uint8_t lo = twi_read(false);
	twi_stop();
	
	return (hi << 8) | lo;
}

void ina_init(const bool max_bus_16v, const float max_current)
{
	twi_init();

	// reset the chip
	ina_write(REG_CONFIGURATION, 0xffff);

	// set the bus voltage range to 16V,
	// averaging to highest value (128 samples, 68.1ms)
	ina_write(REG_CONFIGURATION, max_bus_16v ? 0x1fff : 0x3fff);
	
	// set the calibration register
	current_lsb = max_current / 32768;
	power_lsb = current_lsb * 20;
	const int16_t cal = 0.04096 / (current_lsb * 0.075);
	
	ina_write(REG_CALIBRATION, cal);
}

bool ina_read_values(ina_data* data)
{
	const int16_t bus_voltage_rv = ina_read(REG_BUS_VOLTAGE);
	const bool conversion_ready = (bus_voltage_rv & 2) != 0;
	
	if (conversion_ready)
	{
		const int16_t current_rv 	= ina_read(REG_CURRENT);
		const int16_t power_rv 		= ina_read(REG_POWER);

		data->overflow = (bus_voltage_rv & 1) != 0;
		data->voltage = (bus_voltage_rv >> 3) * 0.004;
		data->power = power_rv * power_lsb;
		data->current = current_rv * current_lsb;
		
		dprint("V=%.2f I=%.3f P=%.2f\n", data->voltage, data->current, data->power);
		
		return true;
	}
	
	return false;
}
