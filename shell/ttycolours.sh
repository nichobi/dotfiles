#!/bin/sh
if [ "$TERM" = "linux" ]; then
  /bin/echo -e "
  \e]P0000000
  \e]P1d53100
  \e]P22fd400
  \e]P3ffc000
  \e]P40042b6
  \e]P5df005b
  \e]P600a4f0
  \e]P7c0c0c0
  \e]P83b3b3b
  \e]P9ff331c
  \e]PA3cff00
  \e]PBfff00a
  \e]PC0071ff
  \e]PDff0098
  \e]PE00d3ff
  \e]PFffffff
  "
  # get rid of artifacts
  clear
fi

