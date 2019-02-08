#include <stdint.h>
#include <stdbool.h>
#include <stdio.h>

#include <avr/io.h>
#include <avr/eeprom.h>
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

	ina_init(true, 2.5);	// init the power meter
	
	// buttons
	ClrBit(DDR(REFRESH_PORT), REFRESH_BIT);
	SetBit(PORT(REFRESH_PORT), REFRESH_BIT);		// pullup
	
	ClrBit(DDR(CHANNEL_PORT), CHANNEL_BIT);
	SetBit(PORT(CHANNEL_PORT), CHANNEL_BIT);		// pullup
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

	ina_data id;
	uint8_t cnt;
	const uint8_t SAMPLES = 100;
	float power, shuntVoltage, busVoltage;
	//char msg[10];
	float prevPower, prevVoltage, wattHours;
	prevPower = prevVoltage = 0;
	
	// check if EEPROM contains invalid value
	if (eeprom_read_word(0) == 0xffff)
		wattHours = 0;
	else
		wattHours = eeprom_read_float(WATT_HOURS_EEPROM);

	const float whFactor = 3600 * 1000L / 68.1;
	while (true)
	{
		shuntVoltage = busVoltage = power = 0;
		for (cnt = 0; cnt < SAMPLES; ++cnt)
		{
			if (cnt == 0)
			{
				//sprintf(msg, "%.2f", prevVoltage);
				led_show_float(prevVoltage);
			}
			else if (cnt == 10)
			{
				//sprintf(msg, "%.2f", prevPower);
				led_show_float(prevPower);
			}
			else if (cnt == 20)
			{
				//sprintf(msg, "%.2f", wattHours);
				led_show_float(wattHours);
			}
			else if (cnt == 30)
			{
				led_clear();
			}
			
			while (!ina_read_values(&id))
				;
			
			power += id.power;
			busVoltage += id.busVoltage;
			shuntVoltage += id.shuntVoltage;
			wattHours += id.power / whFactor;

			dprint("Wh=%f sV=%.5f bV=%.2f I=%.3f P=%.2f\n", wattHours, id.shuntVoltage, id.busVoltage, id.current, id.power);
		}
		
		prevVoltage = busVoltage / SAMPLES;
		prevPower = power / SAMPLES;
		eeprom_write_float(WATT_HOURS_EEPROM, wattHours);

		/*
		char msg[6];
		float temp = ds_get_temperature();
		dprint("temperature = %2.4f\n", temp);

		// the voltage divider factor
		float volt = get_voltage() * 3.7;
		dprint("V avr = %f\n", volt);

		const uint16_t bus_volt = ina_read(REG_busVoltage);
		volt = (bus_volt >> 3) * 0.004;
		dprint("V ina = %f\n", volt);

		const int16_t shunt_v = ina_read(REG_shuntVoltage);
		volt = shunt_v / 100.0;
		dprint("V shunt = %.2f mV\n", volt);
		dprint("---------------\n");

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
		*/
	}
	
	return 0;
}
