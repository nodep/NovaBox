#include <stdint.h>
#include <ctype.h>

#include <avr/io.h>
#include <avr/pgmspace.h>
#include <util/delay.h>

#include "hw_setup.h"
#include "led_display.h"
#include "utils.h"

void led_shift_byte(uint8_t byte)
{
	uint8_t bcnt;

	for (bcnt = 0; bcnt < 8; ++bcnt)
	{
		if (byte & 0x80)
			SetBit(PORT(LED_DATA_PORT), LED_DATA_BIT);
		else
			ClrBit(PORT(LED_DATA_PORT), LED_DATA_BIT);

		SetBit(PORT(LED_CLOCK_PORT), LED_CLOCK_BIT);
		ClrBit(PORT(LED_CLOCK_PORT), LED_CLOCK_BIT);

		byte <<= 1;
	}
}

void led_init(void)
{
	// clear the bits
	ClrBit(PORT(LED_CLOCK_PORT), LED_CLOCK_BIT);
	ClrBit(PORT(LED_DATA_PORT), LED_DATA_BIT);
	
	// the LED shift registers
	SetBit(DDR(LED_DATA_PORT), LED_DATA_BIT);
	SetBit(DDR(LED_CLOCK_PORT), LED_CLOCK_BIT);
	SetBit(DDR(LED_RST_PORT), LED_RST_BIT);

	led_clear();
}

void led_clear(void)
{
	// reset the LED shift registers
	ClrBit(PORT(LED_RST_PORT), LED_RST_BIT);
	_delay_ms(10);
	SetBit(PORT(LED_RST_PORT), LED_RST_BIT);
}

const uint8_t digits[10] PROGMEM = {0b01110111,		// 0
									0b00010100,		// 1
									0b10110011,		// 2
									0b10110110,		// 3
									0b11010100,		// 4
									0b11100110,		// 5
									0b11100111,		// 6
									0b00110100,		// 7
									0b11110111,		// 8
									0b11110110,		// 9
									};

const uint8_t letters[26] PROGMEM =
{
	0x00,0x00,0xc6,0x00,0x00,		// ABCDE
	0x00,0x00,0x00,0x00,0x00,		// FGHIJ
	0x00,0x00,0x00,0x00,0x00,		// KLMON
	0x00,0x00,0x00,0x00,0x00,		// PQRST
	0x00,0xea,0x00,0x00,0x00,0x00,	// UVWXYZ
};

void led_show(const char* msg)
{
	char shift_out[3];
	uint8_t cnt = 0;

	shift_out[0] = 0;
	shift_out[1] = 0;
	shift_out[2] = 0;

	while (*msg  &&  cnt < 3)
	{
		// we only support these: 0123456789 C and V (which looks like a U on the display)
		if (isdigit(*msg))
			shift_out[cnt] = pgm_read_byte(digits + (*msg - '0'));
		else if (isalpha(*msg))
			shift_out[cnt] = pgm_read_byte(letters + (tolower(*msg) - 'a'));

		// is the next char a dot?
		while (msg[1] == '.')
		{
			shift_out[cnt] |= 0x08;
			++msg;
		}

		++cnt;
		++msg;
	}

	// shift the data out
	for (cnt = 2; cnt < 3; cnt--)
		led_shift_byte(shift_out[cnt]);
}

void delay_ms(uint16_t ms)
{
	while (ms > 1000)
	{
		_delay_ms(1000);
		ms -= 1000;
	}

	while (ms > 100)
	{
		_delay_ms(100);
		ms -= 100;
	}

	while (ms > 10)
	{
		_delay_ms(10);
		ms -= 10;
	}

	while (ms)
	{
		_delay_ms(1);
		--ms;
	}
}

const uint8_t snake_parts[28*3] PROGMEM =
{
	0, _BV(6), 50,
	0, _BV(5), 50,
	0, _BV(3), 50,
	0, _BV(2), 50,
	0, _BV(1), 50,
	0, _BV(7), 50,
	0, _BV(6), 50,
	0, _BV(4), 50,
	1, _BV(6), 50,
	1, _BV(5), 50,
	1, _BV(3), 50,
	1, _BV(2), 50,
	1, _BV(1), 50,
	1, _BV(7), 50,
	1, _BV(6), 50,
	1, _BV(4), 50,
	2, _BV(6), 50,
	2, _BV(5), 50,
	2, _BV(3), 50,
	2, _BV(2), 50,
	2, _BV(1), 50,
	2, _BV(7), 50,
	2, _BV(6), 50,
	2, _BV(5), 50,
	2, _BV(0), 70,
	1, _BV(0), 90,
	0, _BV(0), 90,
	0,		0,  0,
};

void led_snake(void)
{
	uint8_t i;
	uint8_t msg[3];

	for (i = 0; i < sizeof(snake_parts); i += 3)
	{
		msg[0] = 0;
		msg[1] = 0;
		msg[2] = 0;

		msg[pgm_read_byte(snake_parts + i)] = pgm_read_byte(snake_parts + i + 1);

		led_shift_byte(msg[2]);
		led_shift_byte(msg[1]);
		led_shift_byte(msg[0]);

		delay_ms(pgm_read_byte(snake_parts + i + 2));
	}
}
