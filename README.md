Remember to Initialize Submodules

```
git submodule update --init
```

To Grab the device defconfig

```
BR2_EXTERNAL=../simple_sbc make f1c200s_simple_sbc_defconfig
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

To make on WSL with a slightly wonky path try

```
PATH=$(grep -v '[[:space:]]'<<<"${PATH//:/$'\n'}"|paste -sd:) make
```

```
To save changes to the defconfig
```

make savedefconfig

```

## JLCPCB Fabrication Note 

The usb differential traces have been routed according to this using their online calculator. Other processes will need these trace widths to be adjusted.

| Impedance (Ω) | Type                     | Signal Layer | Top Ref | Bottom Ref | Trace Width (mm) | Trace Spacing (mm) | Impedance Trace to Copper (mm) |
|--------------|-------------------------|--------------|---------|------------|------------------|------------------|----------------------------|
| 90           | Coplanar Differential Pair | L1           | /       | L2         | 0.1974           | 0.1300           | 0.1900                     |
| 90           | Coplanar Differential Pair | L2           | L1      | L3         | 0.1511           | 0.1300           | 0.1900                     |
| 90           | Coplanar Differential Pair | L3           | L2      | L4         | 0.1511           | 0.1300           | 0.1900                     |
| 90           | Coplanar Differential Pair | L4           | L3      | /          | 0.1974           | 0.1300           | 0.1900                     |
