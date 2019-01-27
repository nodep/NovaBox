#include <stdbool.h>
#include <stdio.h>
#include <stdint.h>

#include "avrdbg.h"
#include "twi.h"
#include "ina219.h"

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

void ina_init(void)
{
	twi_init();

	// reset the chip
	ina_write(REG_CONFIGURATION, 0xffff);

	// set the bus voltage range to 16V
	ina_write(REG_CONFIGURATION, 0x199f);
}
