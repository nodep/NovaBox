#pragma once

#define DS_ERROR_TEMPERATURE	-400

// allowed thermometer resolutions
#define OW_THERM_RES_BITS_9		0b00011111
#define OW_THERM_RES_BITS_10	0b00111111
#define OW_THERM_RES_BITS_11	0b01011111
#define OW_THERM_RES_BITS_12	0b01111111

// init the hardware - call before anything else
void ds_init(uint8_t resolution);

// change the resolution of the reading
bool ds_set_therm_resolution(uint8_t resolution);

// call to start a temperature reading
void ds_start_temp_reading(void);

// call to poll for completeness
bool ds_is_reading_finished(void);

// call to return the temperature in C
float ds_finish_temp_reading(void);

// the previous 3 functions in one call
float ds_get_temperature(void);
