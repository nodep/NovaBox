#pragma once

#ifdef DBGPRINT
# define dprint(...)		printf(__VA_ARGS__)		// gotta love C99, man
# define dprint_P(...)		printf_P(__VA_ARGS__)
# define dprinti(i)			printi(i)
void printi(const uint32_t i);
#else
# define dprint(...)
# define dprint_P(...)
# define dprinti(i)
#endif

void dbgInit(void);
