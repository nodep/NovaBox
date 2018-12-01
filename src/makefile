TARGET  = novabox
DEVICE  = atmega328p

# first prototype
#F_CPU   = 11059200
F_CPU   = 8000000

FUSEH = 0xd9
FUSEL = 0xff
FUSEX = 0xff

#AVRDUDE = avrdude -c stk500v2 -P avrdoper -B 0.1 -p $(DEVICE)
AVRDUDE = avrdude -c stk500v2 -P avrdoper -p $(DEVICE)

CFLAGS	= -I. -Wall -Os
#CFLAGS += -DDBGPRINT

LFLAGS  = -Wl,--relax
LFLAGS += -u vfprintf -lprintf_flt -lm

COMPILE = avr-gcc -mmcu=$(DEVICE) -DF_CPU=$(F_CPU) $(CFLAGS)

OBJECTS = main.o led_display.o ds18b20.o avrdbg.o

hex: $(TARGET).hex

$(TARGET).hex: $(OBJECTS)
	$(COMPILE) -o $(TARGET).elf $(OBJECTS) $(LFLAGS)
	rm -f $(TARGET).hex $(TARGET).eep.hex
	avr-objcopy -j .text -j .data -O ihex $(TARGET).elf $(TARGET).hex
	avr-size -C --mcu=$(DEVICE) $(TARGET).elf

flash: $(TARGET).hex
	$(AVRDUDE) -U flash:w:$(TARGET).hex:i

clean:
	rm -f $(TARGET).hex $(TARGET).elf $(OBJECTS)

fuse:
	$(AVRDUDE) -U hfuse:w:$(FUSEH):m -U lfuse:w:$(FUSEL):m -U efuse:w:$(FUSEX):m

read_fuse:
	$(AVRDUDE) -U hfuse:r:-:h -U lfuse:r:-:h -U efuse:r:-:h

# $(COMPILE) -S -fverbose-asm $< -o $@

.S.o:
	$(COMPILE) -x assembler-with-cpp -c $< -o $@

.c.o:
	$(COMPILE) -c $< -o $@

all: clean $(TARGET).hex
