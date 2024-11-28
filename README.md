Remember to Initialize Submodules

```
git submodule update --init
```

To Grab the device defconfig

```
BR2_EXTERNAL=../f1c100-business-card make f1c100-business-card_defconfig
```

To save changes to the defconfig

```
make savedefconfig
```
