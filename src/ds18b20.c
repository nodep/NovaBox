#include <stdint.h>
#include <stdbool.h>

#include <avr/io.h>
#include <avr/pgmspace.h>
#include <util/delay.h>

#include "ds18b20.h"
#include "hw_setup.h"
#include "utils.h"

#define OW_OUT_LOW()		SetBit(DDR(OW_DATA_PORT), OW_DATA_BIT);
#define OW_RELEASE()		ClrBit(DDR(OW_DATA_PORT), OW_DATA_BIT);

// times taken from AppNote AVR318
#define OW_DELAY_A		6
#define OW_DELAY_B		64
#define OW_DELAY_C		60
#define OW_DELAY_D		10
#define OW_DELAY_E		9
#define OW_DELAY_F		55
#define OW_DELAY_G		0
#define OW_DELAY_H		480
#define OW_DELAY_I		70
#define OW_DELAY_J		410

void ow_init_hw(void)
{
	// this pulls the pin low in output mode,
	// and disables the internal pull-up in input mode
	ClrBit(PORT(OW_DATA_PORT), OW_DATA_BIT);

	// input mode
	OW_RELEASE();
}

void ow_write_one(void)
{
	OW_OUT_LOW();
	_delay_us(OW_DELAY_A);
	OW_RELEASE();
	_delay_us(OW_DELAY_B);
}

void ow_write_zero(void)
{
	OW_OUT_LOW();
	_delay_us(OW_DELAY_C);
	OW_RELEASE();
	_delay_us(OW_DELAY_D);
}

bool ow_read_bit(void)
{
	OW_OUT_LOW();
	_delay_us(OW_DELAY_A);
	OW_RELEASE();
	_delay_us(OW_DELAY_E);

	// low for zero, high for one
	bool result = (PIN(OW_DATA_PORT) & _BV(OW_DATA_BIT)) != 0;

	_delay_us(OW_DELAY_F);

	return result;
}

bool ow_reset_presence(void)
{
	// send the reset
	OW_OUT_LOW();
	_delay_us(OW_DELAY_H);
	OW_RELEASE();

	// wait for presence
	_delay_us(OW_DELAY_I);

	// if data line is pulled low - we have had a response
	const bool result = (PIN(OW_DATA_PORT) & _BV(OW_DATA_BIT)) == 0;

	// wait a little more
	_delay_us(OW_DELAY_J);

	return result;
}

void ow_write_byte(uint8_t b)
{
	uint8_t bitcnt;
	for (bitcnt = 0; bitcnt < 8; ++bitcnt)
	{
		if (b & 1)
			ow_write_one();
		else
			ow_write_zero();

		b >>= 1;
	}
}

uint8_t ow_read_byte(void)
{
	uint8_t retval = 0, bitcnt;

	for (bitcnt = 0; bitcnt < 8; ++bitcnt)
	{
		retval >>= 1;

		if (ow_read_bit())
			retval |= 0x80;
	}

	return retval;
}

// ROM commands
#define OW_READ_ROM			0x33
#define OW_MATCH_ROM		0x55
#define OW_SKIP_ROM			0xCC
#define OW_SEARCH_ROM		0xF0
#define OW_ALARM_SEARCH		0xEC

// other commands
#define OW_CONVERT_T		0x44
#define OW_WRITE_SCRATCHPAD	0x4E
#define OW_READ_SCRATCHPAD	0xBE
#define OW_COPY_SCRATCHPAD	0x48
#define OW_RECALL_E2		0xB8

const uint8_t crc_table[0x100] PROGMEM = {
0x00,0x5e,0xbc,0xe2,0x61,0x3f,0xdd,0x83,0xc2,0x9c,0x7e,0x20,0xa3,0xfd,0x1f,0x41,
0x9d,0xc3,0x21,0x7f,0xfc,0xa2,0x40,0x1e,0x5f,0x01,0xe3,0xbd,0x3e,0x60,0x82,0xdc,
0x23,0x7d,0x9f,0xc1,0x42,0x1c,0xfe,0xa0,0xe1,0xbf,0x5d,0x03,0x80,0xde,0x3c,0x62,
0xbe,0xe0,0x02,0x5c,0xdf,0x81,0x63,0x3d,0x7c,0x22,0xc0,0x9e,0x1d,0x43,0xa1,0xff,
0x46,0x18,0xfa,0xa4,0x27,0x79,0x9b,0xc5,0x84,0xda,0x38,0x66,0xe5,0xbb,0x59,0x07,
0xdb,0x85,0x67,0x39,0xba,0xe4,0x06,0x58,0x19,0x47,0xa5,0xfb,0x78,0x26,0xc4,0x9a,
0x65,0x3b,0xd9,0x87,0x04,0x5a,0xb8,0xe6,0xa7,0xf9,0x1b,0x45,0xc6,0x98,0x7a,0x24,
0xf8,0xa6,0x44,0x1a,0x99,0xc7,0x25,0x7b,0x3a,0x64,0x86,0xd8,0x5b,0x05,0xe7,0xb9,
0x8c,0xd2,0x30,0x6e,0xed,0xb3,0x51,0x0f,0x4e,0x10,0xf2,0xac,0x2f,0x71,0x93,0xcd,
0x11,0x4f,0xad,0xf3,0x70,0x2e,0xcc,0x92,0xd3,0x8d,0x6f,0x31,0xb2,0xec,0x0e,0x50,
0xaf,0xf1,0x13,0x4d,0xce,0x90,0x72,0x2c,0x6d,0x33,0xd1,0x8f,0x0c,0x52,0xb0,0xee,
0x32,0x6c,0x8e,0xd0,0x53,0x0d,0xef,0xb1,0xf0,0xae,0x4c,0x12,0x91,0xcf,0x2d,0x73,
0xca,0x94,0x76,0x28,0xab,0xf5,0x17,0x49,0x08,0x56,0xb4,0xea,0x69,0x37,0xd5,0x8b,
0x57,0x09,0xeb,0xb5,0x36,0x68,0x8a,0xd4,0x95,0xcb,0x29,0x77,0xf4,0xaa,0x48,0x16,
0xe9,0xb7,0x55,0x0b,0x88,0xd6,0x34,0x6a,0x2b,0x75,0x97,0xc9,0x4a,0x14,0xf6,0xa8,
0x74,0x2a,0xc8,0x96,0x15,0x4b,0xa9,0xf7,0xb6,0xe8,0x0a,0x54,0xd7,0x89,0x6b,0x35,
};

bool ow_check_crc(const uint8_t* buff, uint8_t num_bytes)
{
	// we have lotsa flash, so we can use a lookup table to make things simple
	uint8_t c, val = 0;

	for (c = 0; c < num_bytes; ++c)
		val = pgm_read_byte(crc_table + (val ^ buff[c]));

	return val == 0;
}

// *****************************************************************************

uint8_t ds_therm_resolution = 0;

bool ds_set_therm_resolution(uint8_t resolution)
{
	// valid resolution?
	if ((resolution & 0b10011111) != 0b00011111)
		return false;

	if (resolution != ds_therm_resolution)
	{
		ow_reset_presence();
		ow_write_byte(OW_SKIP_ROM);
		ow_write_byte(OW_WRITE_SCRATCHPAD);

		// write the 3 bytes
		ow_write_byte(0x4b);		// Th default value
		ow_write_byte(0x46);		// Tl default value
		ow_write_byte(resolution);	// new resolution

		// now read it back (just for kicks)
		ow_reset_presence();
		ow_write_byte(OW_SKIP_ROM);
		ow_write_byte(OW_READ_SCRATCHPAD);

		uint8_t scratchpad[9], c;
		for (c = 0; c < 9; c++)
			scratchpad[c] = ow_read_byte();

		if (!ow_check_crc(scratchpad, 9))
			return false;

		ds_therm_resolution = resolution;
	}

	return true;
}

void ds_init(uint8_t resolution)
{
	// init the 1-wire pin
	ow_init_hw();

	ds_set_therm_resolution(resolution);
}

void ds_start_temp_reading(void)
{
	// start the reading
	ow_reset_presence();
	ow_write_byte(OW_SKIP_ROM);
	ow_write_byte(OW_CONVERT_T);
}

bool ds_is_reading_finished(void)
{
	return ow_read_bit();
}

float ds_finish_temp_reading(void)
{
	ow_reset_presence();
	ow_write_byte(OW_SKIP_ROM);
	ow_write_byte(OW_READ_SCRATCHPAD);

	// read the entire scratchpad
	uint8_t scratchpad[9], c;
	for (c = 0; c < 9; c++)
		scratchpad[c] = ow_read_byte();

	float retval;
	if (ow_check_crc(scratchpad, 9))
	{
		// according to the datasheet the unused bits are 'undefined'
		// so we better reset them to avoid surprises
		if (ds_therm_resolution == OW_THERM_RES_BITS_9)
			scratchpad[0] &= 0b11111000;
		else if (ds_therm_resolution == OW_THERM_RES_BITS_10)
			scratchpad[0] &= 0b11111100;
		else if (ds_therm_resolution == OW_THERM_RES_BITS_11)
			scratchpad[0] &= 0b11111110;

		const int16_t* pResult = (int16_t*) scratchpad;

		retval = *pResult * 0.0625;
	} else {
		retval = DS_ERROR_TEMPERATURE;
	}

	return retval;
}

float ds_get_temperature(void)
{
	ds_start_temp_reading();

	do {
		_delay_ms(25);
	} while (!ds_is_reading_finished());

	return ds_finish_temp_reading();
}
