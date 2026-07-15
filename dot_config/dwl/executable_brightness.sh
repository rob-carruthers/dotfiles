#!/bin/bash

if [[ "$1" == "up" ]]; then
  brightnessctl s +5%
fi

if [[ "$1" == "down" ]]; then
  brightnessctl s 5%-
fi

# pkill -SIGRTMIN+2 someblocks
