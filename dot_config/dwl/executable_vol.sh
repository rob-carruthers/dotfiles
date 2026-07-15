#!/bin/bash

VOL_LIMIT=1.0

if [[ "$1" == "up" ]]; then
  # pulsemixer --change-volume +5
  wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+ -l $VOL_LIMIT
fi

if [[ "$1" == "down" ]]; then
  # pulsemixer --change-volume -5
  wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
fi

if [[ "$1" == "toggle" ]]; then
  # pulsemixer --toggle-mute
  wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
fi

# pkill -SIGRTMIN+1 someblocks
