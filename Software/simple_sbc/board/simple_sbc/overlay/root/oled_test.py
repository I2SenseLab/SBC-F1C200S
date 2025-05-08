from luma.core.interface.serial import i2c
from luma.oled.device import ssd1306  # or ssd1309 if that's your chip
from luma.core.render import canvas
from PIL import ImageFont

# Create I2C interface
serial = i2c(port=0, address=0x3C)  # Adjust port/address if needed

# Create device
device = ssd1306(serial, width=128, height=32)  # or height=64 for 128x64 displays

# Display message
with canvas(device) as draw:
    draw.text((10, 10), "Hello, world!", fill="white")