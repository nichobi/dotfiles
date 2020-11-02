function zle-keymap-select zle-line-init {
    if [ $KEYMAP = vicmd ]; then
        echo -ne '\e[1 q' # Set block cursor
    else
        echo -ne '\e[5 q' # Set beam cursor
    fi
}

function zle-line-finish {
    echo -ne '\e[1 q' # Set block cursor
}

