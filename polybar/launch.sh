#!/usr/bin/env bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use 
polybar-msg cmd quit

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload bar1 &
    MONITOR=$m polybar --reload bar2 &
  done
else
  polybar --reload bar1 &
  polybar --reload bar2 &
fi
