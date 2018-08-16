# NovaBox
Circuit and PCB design for a Bluetooth stereo amplifier

### CSR8635 based circuit

![CSR8635 module](docs/CSR8635_module.jpg)

The circuit is based around the CSR8635 module you can get on most chinese online shops.

### Power

The main motivation for this project was the fact that I needed a Bluetooth speaker with batteries that are easy to remove and replace. Most of the commercial Bluetooth speakers have a charging port, and when you run out of battery power the speaker has to be tethered to a charger for several hours. With removable batteries it takes 10 seconds to go from empty to full and you don't need an integrated charger. Even though CSR8635 needs only a few components to be able to charge Li-ion batteries, an integrated charger would make the PCB larger, there would be problems with heat dissipation during charging, and charging a medium capacity 18650 battery would take too long.

The circuit is powered from a single unprotected Li-ion 18650 battery. CSR8635 is powered directly from the battery, while the rest of the circuit is powered through an [LT1308](docs/LT1308abfb.pdf) which boosts the voltage to 5V.

The circuit has reverse battery protection and an indicator LED which turns on when the battery is reversed.

### Buttons

The circuit has 4 buttons and an on/off switch.

### Audio amplifier

The two differential outputs from the module are amplified using a pair of PAM8304.

### Battery charge level

The circuit includes a 4 level battery charge indicator. It works by using four op-amps as comparators.

### Flash configuration

The SPI configuration inteface of the CSR8635 module is brought out to a 5 pin header.

The circuit and PCB can be edited using KiCad v5.
