#include <stdint.h>
#include <stdbool.h>
#include <stdio.h>

#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h>

#include "utils.h"
#include "hw_setup.h"
#include "led_display.h"
#include "ds18b20.h"
#include "avrdbg.h"

#define VOLTAGE_SAMPLES	16

float get_voltage(void)
{
	ADMUX = _BV(REFS0)		// reference is AVCC
			//| _BV(ADLAR)	// higher precision
			| _BV(MUX0);	// channel ADC1

	uint16_t adc_sum = 0;
	uint8_t c;
	for (c = 0; c < VOLTAGE_SAMPLES; ++c)
	{
		ADCSRA = _BV(ADEN)					// enable ADC
				| _BV(ADPS2) | _BV(ADPS1) | _BV(ADPS0)	// prescaler 128
				| _BV(ADSC);				// start conversion

		// wait for the conversion to finish
		loop_until_bit_is_set(ADCSRA, ADIF);

		// remember the result
		adc_sum += ADC;

		// clear the ADIF bit by writing one
		SetBit(ADCSRA, ADIF);

		_delay_ms(50);
	}

	ADCSRA = 0;		// disable ADC

	// 5.09 is the output voltage of our voltage
	// regulator and also our reference voltage
	return adc_sum * 5.05 / 1023 / VOLTAGE_SAMPLES;
}

void init_hw(void)
{
	led_init();							// led display
	ds_init(OW_THERM_RES_BITS_12);		// DS18B20 thermometer

	// the sensor readout button
	ClrBit(DDR(SENS_BTN_PORT), SENS_BTN_BIT);	// pin to input
	SetBit(PORT(SENS_BTN_PORT), SENS_BTN_BIT);	// enable pull-up

	dbgInit();
}

// toggle the bluetooth MFB switch
void btsw_toggle(void)
{
	uint8_t c;
	char msg[4];

	SetBit(DDR(BT_SW_PORT), BT_SW_BIT);		// pin to output
	SetBit(PORT(BT_SW_PORT), BT_SW_BIT);	// pin hi
	
	for (c = 5; c < 6; c--)
	{
		sprintf(msg, "%3d", c);
		led_show(msg);
		_delay_ms(800);
	}
	
	ClrBit(PORT(BT_SW_PORT), BT_SW_BIT);	// no pullups
	ClrBit(DDR(BT_SW_PORT), BT_SW_BIT);		// pin to high impedance input

	led_clear();
}

int main(void)
{
	init_hw();

	dprint("i live...\n");

	led_snake();

	btsw_toggle();

	for (;;)
	{
		led_show(" . . .");

		float temp, volt;
		char msg[6];

		temp = ds_get_temperature();
		dprint("temperature = %2.4f\n", temp);

		volt = get_voltage();
		dprint("voltage = %f\n", volt);

		sprintf(msg, "%2.1f", temp);
		led_show(msg);
		_delay_ms(2000);

		sprintf(msg, "%1.2f", volt);
		led_show(msg);
		_delay_ms(2000);

		led_clear();

		// wait for the button press
		for (;;)
		{
			if ((PIN(SENS_BTN_PORT) & _BV(SENS_BTN_BIT)) == 0)
				break;

			_delay_ms(10);
		}
	}

	return 0;
}
