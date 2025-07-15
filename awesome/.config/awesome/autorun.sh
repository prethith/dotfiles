#!/bin/bash

intern=eDP-1
extern=DP-1-0

if xrandr | grep "$extern disconnected"; then
  xrandr --output "$extern" --off --output "$intern" --auto --primary
else
  xrandr --output "$intern" --off --output "$extern" --auto
fi
