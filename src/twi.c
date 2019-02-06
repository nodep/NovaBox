#include <stdbool.h>
#include <stdint.h>

#include <avr/io.h>

#include "twi.h"

void twi_wait(void)
{
	while ((TWCR & _BV(TWINT)) == 0)
		;
}

void twi_init(void)
{
	// set the TWI frequency
	TWSR = 0x00;
	TWBR = 0x0B;	// 200kHz at 8Mhz
}

void twi_start(void)
{
	TWCR = _BV(TWINT) | _BV(TWSTA) | _BV(TWEN);
	twi_wait();
}

void twi_stop(void)
{
	TWCR = _BV(TWINT) | _BV(TWSTO) | _BV(TWEN);
}

bool twi_write(uint8_t u8data)
{
	TWDR = u8data;
	TWCR = _BV(TWINT) | _BV(TWEN);
	twi_wait();
	
	uint8_t status = TWSR & TWSR_MASK;
	
	return status == TWSR_SLA_W_ACK;
}

uint8_t twi_read(bool ack)
{
	if (ack)
		TWCR = _BV(TWINT) | _BV(TWEN) | _BV(TWEA);
	else
		TWCR = _BV(TWINT) | _BV(TWEN);
		
	twi_wait();

	return TWDR;
}
