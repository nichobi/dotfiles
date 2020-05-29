#!/bin/sh

swaylock -f -K --clock -c 000000 \
	 -i ~/.config/sway/moon.jpg \
	 --indicator-idle-visible \
	 --indicator-radius 100 \
	 --indicator-thickness 7 \
	 --ignore-empty-password \
	 --ring-color 303030 \
	 --key-hl-color 808080 \
	 --text-color ffffff \
	 --line-color 00000000 \
	 --inside-color 00000088 \
	 --separator-color 00000000 \
	 --fade-in 0.5 \
	 "$@"
	 #--effect-scale 0.5 --effect-blur 7x3 --effect-scale 2 \
	 #--effect-vignette 0.5:0.5 \

