#!/bin/bash -e
# based on https://github.com/Squonk42/buildroot-licheepi-zero

BOARD_DIR="$(dirname $0)"

# Step 1: Copy files into the root filesystem
mkdir -p "${TARGET_DIR}/boot"
cp "${BINARIES_DIR}/zImage" "${TARGET_DIR}/boot/"
cp "${BINARIES_DIR}/f1c200s_simple_sbc.dtb" "${TARGET_DIR}/boot/"
cp "${BINARIES_DIR}/boot.scr" "${TARGET_DIR}/boot/"

# combined bootable image
GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"

rm -rf "${GENIMAGE_TMP}"

genimage \
  --rootpath "${TARGET_DIR}" \
  --tmppath "${GENIMAGE_TMP}" \
  --inputpath "${BINARIES_DIR}" \
  --outputpath "${BINARIES_DIR}" \
  --config "${GENIMAGE_CFG}"

exit $?
