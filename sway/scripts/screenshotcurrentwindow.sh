#!/usr/bin/env bash

APPNAME=$(swaymsg -t get_tree   | jq -r '.. | (.nodes? // empty)[] | select(.focused==true) | (.app_id // .name)')
PICDIR=$(xdg-user-dir PICTURES)
DATE=$(date +'%Y-%m-%d %H-%M-%S')

grimshot --notify save active "$PICDIR/screenshots/$APPNAME $DATE.png"

