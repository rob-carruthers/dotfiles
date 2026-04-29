#!/bin/bash

sensors k10temp-* 2>/dev/null | awk '
  /Tccd1/ { temp=$2; found=1 }
  /Tctl/ && !found { temp=$2 }
  END {
    gsub(/[^0-9.]/, "", temp)
    printf "%d°C", int(temp+0.5)
  }'


