#!/usr/bin/env bash

# If we're being piped into, read the pipe so we can echo it out at the end without it being eaten
# by swaymsg
! [ -t 0 ] && stdin=$(cat)
isSplit=$(swaymsg -t get_tree | jq -r '.. | (.nodes? // empty)[] | select(.nodes | any (.focused==true)) | . ["layout"] | startswith("split")')
if [ "$isSplit" == true ]; then
  readarray -t dimension < <(swaymsg -t get_tree | jq -r '.. | (.nodes? // empty)[] | select(.focused==true) | .rect | .width,.height')
  if [ "${dimension[0]}" -ge "${dimension[1]}" ]; then
    swaymsg -q splith
  else
    swaymsg -q splitv
  fi
fi
! [ -t 0 ] && echo "$stdin"
