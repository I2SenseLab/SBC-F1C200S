#!/bin/bash
set -e

IIO_DEV_PATH="/sys/bus/iio/devices/iio:device0"
DEV_NODE="/dev/iio:device0"

# Confirm device path
if [ ! -d "$IIO_DEV_PATH" ]; then
  echo "IIO device not found at $IIO_DEV_PATH"
  exit 1
fi

echo "Found IIO device: $IIO_DEV_PATH"

# Enable scan elements
for channel in in_intensity_red in_intensity_ir; do
  EN_PATH="$IIO_DEV_PATH/scan_elements/${channel}_en"
  if [ -f "$EN_PATH" ]; then
    echo "Enabling channel: $channel"
    echo 1 > "$EN_PATH"
  else
    echo "Warning: Channel $channel not found"
  fi
done

# Optionally enable temperature too
if [ -f "$IIO_DEV_PATH/scan_elements/in_temp_en" ]; then
  echo "Enabling temperature channel"
  echo 1 > "$IIO_DEV_PATH/scan_elements/in_temp_en"
fi

# Set buffer length (optional, default is fine)
echo 256 > "$IIO_DEV_PATH/buffer/length"

# Enable buffer
echo 1 > "$IIO_DEV_PATH/buffer/enable"

echo "Buffer enabled. Reading data..."
echo "Press Ctrl+C to stop."

# Read raw binary data and show hex dump
cat "$DEV_NODE" | hexdump -C
