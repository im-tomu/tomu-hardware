
# [Tomu, I'm](tomu.im)

[I'm Tomu](tomu.im) a tiny ARM microprocessor which fits in your USB port. 
I have two buttons and two LEDs.

## WARNING: This design hasn't been proven yet!

Built out of a 3d printed part + 2 layer "thin" PCB (0.4mm or 0.6mm thick).

The board has;
 * 5mil traces
 * 4mil clearance
 * 0.3mm drill / 0.6mm vias

--

Uses a Silicon Labs EFM32HG309 ([datasheet](https://www.silabs.com/Support%20Documents/TechnicalDocs/EFM32HG309.pdf)).

The important features are;
 * [~$2.15 USD on Digikey](http://www.digikey.com/product-detail/en/silicon-labs/EFM32HG309F64G-A-QFN24/336-3207-ND/5142721)
 * QFN24 - 5mm x 5mm package
 * Inbuilt 5V to 3V3 regulator.
 * Crystal-less USB

These make something which is almost hand solder-able fit into the tiny size.

## BOM


All parts are ordered from Digikey but could easily be ordered from somewhere else.

 * [Digikey BOM in CSV format](bom-digikey.csv)

Individual parts;

 * Resistors
  - 2 x 0402 - 15 Ohm - [Digikey](https://www.digikey.com.au/short/3m8rz5)
  - 2 x 0402 - ~50 Ohm (Depends on LED choice)

 * Capacitors - [Digikey Capacitors 0402, >1uF](https://www.digikey.com.au/short/3m8r4z)
  - 2 x Capacitor 1uF 0402
  - 1 x Capacitor >10uF 0402

 * 2 x LED 0402
  - You choice of two different colors (might require adjustment of R1/R2).
  - 5mA LEDs are better choice.
  - Get highest millicandela rating you can.
  - [Digikey Search of LEDs in 0402 package](https://www.digikey.com.au/short/3m8rz0)

 * 1 x EFM32HG309 or EMF32HG308


## TODO

 * Create the device
 * Create the 3d print model.
 * Write the firmware for the device.

## FAQ

##### Why did you create this?

The aim was to prove that a device which fits in your USB port could be created
**by hobbists in small quantities** extremely cheaply.

##### Where does the name Tomu come from?

TOMU comes from the abbreviation "Tim's Open Micro USB".

##### What can I use this for?

What ever you want! If you do create something, please send me the info!

## License

The contents of this repository excluding "third_party" folder is released
under your choice of the following two licences:

 * the "Creative Commons Attribution-ShareAlike 4.0 International License"
   (CC BY-SA 4.0) full text of this license is included in the LICENSE file
   and a copy can also be found at
   http://creativecommons.org/licenses/by-sa/4.0/

 * the "TAPR Open Hardware License" full text of this license is included
   in the LICENSE file and a copy can also be found at
   http://www.tapr.org/OHL

