#pragma once

// bit set/clear/toggle
#define SetBit(var, mask)	((var) |= (uint8_t)  _BV(mask))
#define ClrBit(var, mask)	((var) &= (uint8_t) ~_BV(mask))
#define TogBit(var, mask)	((var) ^= (uint8_t)  _BV(mask))


// several bits set/clear/toggle
#define SetVal(var, mask)	((var) |= (uint8_t)  (mask) )
#define ClrVal(var, mask)	((var) &= (uint8_t) ~(mask) )
#define TogVal(var, mask)	((var) ^= (uint8_t)  (mask) )


// port helpers
#define pp_replace(a, b)	a##b
#define PORT(a)				pp_replace(PORT, a)
#define DDR(a)				pp_replace(DDR, a)
#define PIN(a)				pp_replace(PIN, a)


// set and clear bit values
#define _B0(b)		0
#define _B1(b)		_BV(b)