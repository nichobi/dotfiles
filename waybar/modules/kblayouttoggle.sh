active=`swaymsg -t get_inputs | jq -r "first(.[]|select(.type == \"keyboard\")) | .xkb_active_layout_index"`
next=`expr \( $active + 1 \) % 2`
swaymsg "input type:keyboard xkb_switch_layout $next"
