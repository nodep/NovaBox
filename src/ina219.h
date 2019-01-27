#pragma once

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

void ina_init(void);
uint16_t ina_read(const uint8_t reg);
void ina_write(const uint8_t reg, const uint16_t val);
