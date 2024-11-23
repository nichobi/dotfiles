#!/usr/bin/env bash

new_is_tiling=$(swaymsg -t get_tree | jq -r '.. | (.nodes? // empty )[] | select(.nodes | any (.focused==true)) | . ["layout"] | startswith("split")' 2>&1)
if [ "$new_is_tiling" == true ] ; then
  new_pid=$(swaymsg -t get_tree | jq '.. | (.nodes? // empty)[] | select(.focused==true) | .["pid"]')
  swaymsg 'move to scratchpad'
  focused_is_tiling=$(swaymsg -t get_tree | jq -r '.. | (.nodes? // empty)[] | select(.nodes | any (.focused==true)) | . ["layout"] | startswith("split")')
  if [ "$focused_is_tiling" == true ]; then
    readarray -t dimension < <(swaymsg -t get_tree | jq -r '.. | (.nodes? // empty)[] | select(.focused==true) | .rect | .width,.height')
    if [ "${dimension[0]}" -ge "${dimension[1]}" ]; then
      swaymsg -q splith
    else
      swaymsg -q splitv
    fi
  fi
  swaymsg "[pid=$new_pid] scratchpad show, floating disable"
fi
