#!/usr/bin/env python3
import time

def read(path):
    with open(path) as f:
        return f.read().strip()

def safe_read(path, default="0"):
    try:
        return read(path)
    except Exception:
        return default

with open("/tmp/imu_log.csv", "w") as f:
    f.write("time,accel_x,accel_y,accel_z,gyro_x,gyro_y,gyro_z,quat_w,quat_x,quat_y,quat_z\n")
    while True:
        t = time.time()

        # Accelerometer
        x = safe_read("/sys/bus/iio/devices/iio:device0/in_accel_x_raw")
        y = safe_read("/sys/bus/iio/devices/iio:device0/in_accel_y_raw")
        z = safe_read("/sys/bus/iio/devices/iio:device0/in_accel_z_raw")

        # Gyroscope
        gx = safe_read("/sys/bus/iio/devices/iio:device0/in_anglvel_x_raw")
        gy = safe_read("/sys/bus/iio/devices/iio:device0/in_anglvel_y_raw")
        gz = safe_read("/sys/bus/iio/devices/iio:device0/in_anglvel_z_raw")

        # Quaternion
        quat_raw = safe_read("/sys/bus/iio/devices/iio:device0/in_rot_quaternion_raw", "0 0 0 0")
        qw, qx, qy, qz = quat_raw.split()[:4]

        line = f"{t},{x},{y},{z},{gx},{gy},{gz},{qw},{qx},{qy},{qz}"
        print(line)
        f.write(line + "\n")
        f.flush()
        time.sleep(0.1)
