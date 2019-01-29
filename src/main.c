#include <stdint.h>
#include <stdbool.h>
#include <stdio.h>

#include <avr/io.h>
#include <util/delay.h>

#include "utils.h"
#include "hw_setup.h"
#include "avrdbg.h"
#include "led_display.h"
#include "ds18b20.h"
#include "ina219.h"

void init_hw(void)
{
	dbgInit();
	
	led_init();				// led display
	
	ds_init(OW_THERM_RES_BITS_12);		// DS18B20 thermometer

	ina_init();
	
	// amp shutdown pin
	SetBit(DDR(AMP_SHDN_PORT), AMP_SHDN_BIT);
	ClrBit(PORT(AMP_SHDN_PORT), AMP_SHDN_BIT);
}

float get_voltage(void)
{
	ADMUX = _BV(REFS0);		// reference is AVCC; channel ADC0

	const uint8_t VOLTAGE_SAMPLES = 16;
	
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

	// 4.01 is the output voltage of our voltage
	// regulator and also our reference voltage
	return adc_sum * 4.01 / 1023 / VOLTAGE_SAMPLES;
}

int main(void)
{
	init_hw();
	
	dprint("\nI live...\n");

	while (true)
	{
		led_show(" . . .");

		//TogBit(PORT(AMP_SHDN_PORT), AMP_SHDN_BIT);
		//_delay_ms(3000);

		char msg[6];
		float temp = ds_get_temperature();
		dprint("temperature = %2.4f\n", temp);

		// the voltage divider factor
		float volt = get_voltage() * 3.7;
		dprint("V avr = %f\n", volt);

		/*
		const uint16_t bus_volt = ina_read(REG_BUS_VOLTAGE);
		volt = (bus_volt >> 3) * 0.004;
		dprint("V ina = %f\n", volt);

		const int16_t shunt_v = ina_read(REG_SHUNT_VOLTAGE);
		volt = shunt_v / 100.0;
		dprint("V shunt = %.2f mV\n", volt);
		dprint("---------------\n");
		*/

		sprintf(msg, "%2.1f", temp);
		led_show(msg);
		_delay_ms(2000);

		sprintf(msg, "%1.2f", volt);
		led_show(msg);
		_delay_ms(2000);

		float percent = (volt - 9.6) * 33.33;
		sprintf(msg, "%2.1f", percent);
		led_show(msg);
		_delay_ms(2000);
	}
	
	return 0;
}
