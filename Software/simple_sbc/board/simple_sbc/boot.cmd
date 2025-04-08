setenv bootargs "console=ttyS0,115200n8 root=/dev/mmcblk0p2 rootwait rw rootfstype=ext4"
mmc dev 0
ext4load mmc 0:2 0x80008000 /boot/zImage
ext4load mmc 0:2 0x80C00000 /boot/f1c200s_simple_sbc.dtb
bootz 0x80008000 - 0x80C00000