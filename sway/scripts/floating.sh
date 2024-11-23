#!/usr/bin/env bash
# https://github.com/Synthetica9/sway-floating

$@ &
pid=$!

swaymsg -t subscribe -m '[ "window" ]' \
  | jq --unbuffered --argjson pid "$pid" '.container | select(.pid == $pid) | .id' \
  | xargs -I '@' -- swaymsg '[ con_id=@ ] floating enable' &

subscription=$!

echo Going into wait state

# Wait for our process to close
tail --pid=$pid -f /dev/null

echo Killing subscription
kill $subscription
