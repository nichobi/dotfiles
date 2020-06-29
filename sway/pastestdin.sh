CLIP=$(mktemp /tmp/clip.XXXXX)
wl-paste -n > $CLIP
cat | wl-copy --trim-newline && ydotool key ctrl+v
cat $CLIP | wl-copy
rm $CLIP
