
## Usage
The board has an unpopulated header for the SPI0 port which can be used to write to the flash chip directly. The F1C100 chip also includes a USB stack and SPI Flash driver in the internal bootloader in "FEL" mode, which can be used to write to the first 16MB of the chip.
* To force the device in to FEL mode, first bridge the CS pin with 3v3 to pull the line high and make the F1c100 footloader think there is no boot device.
* Plug the board in to a PC via USB. The LCD should light up white, and the device should enumerate as a USB device.
* Remove the bridge from chip select (CS) pin.
* Follow the instructions to get **sunxi-tools** for your OS [here](https://linux-sunxi.org/FEL).
* Build the Buildroot external tree:
```
BR2_EXTERNAL=../simple_sbc make f1c200s_simple_sbc_defconfig
```
* Use **sunxi-fel** to write the *flash.bin* file to the flash drive:
```
./sunxi-fel -p spiflash-write 0 flash.bin
```
* Reboot the device by either bridging the *reset* jumper, or clycling power.

## Benchmark Results 

# dhrystone

Dhrystone Benchmark, Version 2.1 (Language: C)

Program compiled without 'register' attribute

Please give the number of runs through the benchmark: 1000000000

Execution starts, 1000000000 runs through Dhrystone
Execution ends

Final values of the variables used in the benchmark:

Int_Glob:            5
        should be:   5
Bool_Glob:           1
        should be:   1
Ch_1_Glob:           A
        should be:   A
Ch_2_Glob:           B
        should be:   B
Arr_1_Glob[8]:       7
        should be:   7
Arr_2_Glob[8][7]:    1000000010
        should be:   Number_Of_Runs + 10
Ptr_Glob->
  Ptr_Comp:          94608
        should be:   (implementation-dependent)
  Discr:             0
        should be:   0
  Enum_Comp:         2
        should be:   2
  Int_Comp:          17
        should be:   17
  Str_Comp:          DHRYSTONE PROGRAM, SOME STRING
        should be:   DHRYSTONE PROGRAM, SOME STRING
Next_Ptr_Glob->
  Ptr_Comp:          94608
        should be:   (implementation-dependent), same as above
  Discr:             0
        should be:   0
  Enum_Comp:         1
        should be:   1
  Int_Comp:          18
        should be:   18
  Str_Comp:          DHRYSTONE PROGRAM, SOME STRING
        should be:   DHRYSTONE PROGRAM, SOME STRING
Int_1_Loc:           5
        should be:   5
Int_2_Loc:           13
        should be:   13
Int_3_Loc:           7
        should be:   7
Enum_Loc:            1
        should be:   1
Str_1_Loc:           DHRYSTONE PROGRAM, 1'ST STRING
        should be:   DHRYSTONE PROGRAM, 1'ST STRING
Str_2_Loc:           DHRYSTONE PROGRAM, 2'ND STRING
        should be:   DHRYSTONE PROGRAM, 2'ND STRING

Microseconds for one run through Dhrystone:    1.8
Dhrystones per Second:                      565163.3


## Acknowledgments
This project is based heavily on the work of others; I would like to acknowledge these project in particular:
* https://github.com/thirtythreeforty/businesscard-linux/tree/master
* https://github.com/florpor/licheepi-nano/tree/master
* [F1C100 Datasheet](https://whycan.com/files/members/3/F1C100s_Datasheet_V1_0.pdf)
* [Lichee-Pi Nano](https://wiki.sipeed.com/hardware/en/lichee/Nano/Nano.html) 