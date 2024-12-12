Remember to Initialize Submodules
```
git submodule update --init
```

To Grab the device defconfig
```
BR2_EXTERNAL=../simple_sbc make f1c100-business-card_defconfig
```

To make modifications to the config run
```
make menuconfig
```

To make the actual bin file run
```
make clean
make
```

```
To save changes to the defconfig
```
make savedefconfig
```