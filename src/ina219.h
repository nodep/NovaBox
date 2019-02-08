#pragma once

void ina_init(const bool max_bus_16v, const float max_current);

typedef struct
{
	float	shuntVoltage;
	float	busVoltage;
	float	current;
	float	power;
	bool	overflow;
} ina_data;

bool ina_read_values(ina_data* data);