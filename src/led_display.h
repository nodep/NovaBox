#pragma once

// inits the hardware
void led_init(void);

// clears the display
void led_clear(void);

// up to three chars, with optional dots after each character (max 6 chars)
// for instance:
// 3.4V
// 32C
// 1.2.3.

void led_show(const char* msg);
void led_show_float(const float num);

// shifts a single bit through the display
void led_snake(void);
