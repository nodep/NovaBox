#pragma once

//#define FIRST_PROTOTYPE
#define SECOND_PROTOTYPE

#ifdef FIRST_PROTOTYPE
	// LED shift registers
	#define LED_DATA_PORT	D
	#define LED_DATA_BIT	6

	#define LED_CLOCK_PORT	D
	#define LED_CLOCK_BIT	7

	#define LED_RST_PORT	B
	#define LED_RST_BIT		0

	// DS18B20 thermometer
	#define OW_DATA_PORT	D
	#define OW_DATA_BIT		2

	// the pin which turns on the bluetooth module
	#define BT_SW_PORT		C
	#define BT_SW_BIT		5

	// the sensor readout button
	#define SENS_BTN_PORT	B
	#define SENS_BTN_BIT	1

#elif defined(SECOND_PROTOTYPE)

	// LED shift registers
	#define LED_DATA_PORT	B
	#define LED_DATA_BIT	1

	#define LED_CLOCK_PORT	D
	#define LED_CLOCK_BIT	7

	#define LED_RST_PORT	B
	#define LED_RST_BIT		0

	// DS18B20 thermometer
	#define OW_DATA_PORT	D
	#define OW_DATA_BIT		0

	// the pin which turns on the bluetooth module
	#define BT_SW_PORT		C
	#define BT_SW_BIT		5

	// the sensor readout button
	#define SENS_BTN_PORT	D
	#define SENS_BTN_BIT	4
#endif