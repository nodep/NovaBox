#pragma once

void ina_init(const bool max_bus_16v, const float max_current);

typedef struct
{
	float	power;
	float	current;
	float	voltage;
	bool	overflow;
} ina_data;

bool ina_read_values(ina_data* data);