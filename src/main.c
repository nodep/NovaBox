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
	
	//ds_init(OW_THERM_RES_BITS_12);		// DS18B20 thermometer

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

	// read the persistent values
	float wattHours, ampHours, minVoltage;
	wattHours = ampHours = 0.0;
	minVoltage = 100.0;
	
	// check if EEPROM contains a valid value
	if (eeprom_read_word(0) != 0xffff)
	{
		wattHours = eeprom_read_float(WATT_HOURS_EEPROM);
		ampHours = eeprom_read_float(AMP_HOURS_EEPROM);
		minVoltage = eeprom_read_float(MIN_VOLTAGE_EEPROM);
	}

	const uint8_t CLEAR_COUNTER_MAX = 16;
	const uint16_t REFRESH_EVERY_CYCLES = 300;
	uint8_t clearCounter = 0;
	const float timeRatio = 3600 * 1000L / 128.0;
	uint32_t totalSamples = 0, prevRefresh = 0;
	while (true)
	{
		ina_data id;
		// read the ina data
		while (!ina_read_values(&id))
			;

		if (minVoltage > id.busVoltage)
			minVoltage = id.busVoltage;
		
		if ((PIN(CHANNEL_PORT) & _BV(CHANNEL_BIT)) == 0)
		{
			if (clearCounter < CLEAR_COUNTER_MAX+1)
				clearCounter++;
			
			if (clearCounter == 1)
				led_show("clr");
			
			if (clearCounter == CLEAR_COUNTER_MAX)
			{
				led_show("ok");
				wattHours = ampHours = 0;
				minVoltage = id.busVoltage;
			}
		}
		else
		{
			if (clearCounter)
				led_clear();
			
			clearCounter = 0;
		}

		uint16_t sinceRefresh = totalSamples - prevRefresh;
		if (sinceRefresh == REFRESH_EVERY_CYCLES  ||  (PIN(REFRESH_PORT) & _BV(REFRESH_BIT)) == 0)
		{
			prevRefresh = totalSamples;
			sinceRefresh = 0;
			
			eeprom_write_float(AMP_HOURS_EEPROM, ampHours);
			eeprom_write_float(WATT_HOURS_EEPROM, wattHours);
			eeprom_write_float(MIN_VOLTAGE_EEPROM, minVoltage);
		}

		if (sinceRefresh == 0)
			led_show_float(id.busVoltage);
		else if (sinceRefresh == 10)
			led_show_float(id.power);
		else if (sinceRefresh == 20)
			led_show_float(ampHours);
		else if (sinceRefresh == 30)
			led_show_float(minVoltage);
		else if (sinceRefresh == 40)
			led_clear();
		
		wattHours += id.power / timeRatio;
		ampHours += id.current / timeRatio;
		++totalSamples;

		dprint("Wh=%f Ah=%f bV=%.2f I=%.3f P=%.2f minV=%.2f lc=%lu\n", wattHours, ampHours, id.busVoltage, id.current, id.power, minVoltage, totalSamples);
		
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
