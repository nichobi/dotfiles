#!/bin/sh

CLIP=$(mktemp /tmp/clip.XXXXX)
wl-paste -n > "$CLIP"
cat | wl-copy --trim-newline && ydotool key ctrl+v
wl-copy < "$CLIP"
rm "$CLIP"

