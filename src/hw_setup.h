#pragma once

// the thermometer DS18b20
#define OW_DATA_PORT	C
#define OW_DATA_BIT		2

// the voltage of the battery
#define BATT_SNS_PORT	C
#define BATT_SNS_BIT	0

// buttons
#define REFRESH_PORT	B
#define REFRESH_BIT		1

#define CHANNEL_PORT	B
#define CHANNEL_BIT		2

// the LED display
#define LED_DATA_PORT	D
#define LED_DATA_BIT	0

#define LED_CLOCK_PORT	D
#define LED_CLOCK_BIT	2

#define LED_RST_PORT	D
#define LED_RST_BIT		3

// EEPROM addresses
#define WATT_HOURS_EEPROM	((float*) 0)
