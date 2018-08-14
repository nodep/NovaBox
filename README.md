# NovaBox
Circuit and PCB design for a Bluetooth stereo amplifier

### CSR8635 based circuit

![CSR8635 module](docs/CSR8635_module.jpg)

The circuit is based around the CSR8635 module you can get on most chinese online shops. The output from the module is amplified using a pair of PAM8304 (one for each channel).

The circuit is powered from a single unprotected Li-ion 18650 battery.

I have decided not to include a battery charger, even though CSR8635 needs only a few components to be able to charge Li-ion batteries. An integrated charger would make the PCB larger, there would be problems with heat disipation during charging, and charging a medium capacity 18650 battery would take too long (over 7 hours at 500mA).

The circuit includes a 4 level battery gauge indicator.

The CSR8635 configuration SPI inteface is brought out to a 5 pin connector.

The circuit and PCB can be edited using KiCad v5.

This is still a work in progress. Currently, I am working on a version with battery over-discharge protection.