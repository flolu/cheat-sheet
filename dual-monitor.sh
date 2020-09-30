#!/bin/sh
xrandr \
  --output DVI-I-0 --mode 1920x1080 --pos 0x610 --rotate left \
  --output HDMI-0 --primary --mode 3440x1440 --pos 1080x0 --rotate normal --rate 99.98
