# Design Notes - Erata 

Initial Board Ordered 9th July 2024 - $148.59
This was for 5 boards assembled. There were a few minor issues with the initial board which have been both corrected and improved upon.

- The board moves the SD Card to the correct interface. This should allow full size SD cards to be run. I would assume a 32GB limit however.
- 16MB of Nand flash has been added to the design to act as the boot rom 
- A RP2040 and associated circuitry has been added to facilitate easy communication through the F1C200S UART interface without requiring USB Gadget to be fully functional initially.

# Note
- Manually Verified and Adjusted the uploaded Bill of Materials.
- At time of writing October 2nd, waiting on JLCPCB parts order to be fully fulfilled before placing PCB order. 