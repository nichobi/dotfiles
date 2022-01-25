alias cacavid='mplayer -vo caca -msglevel all=-1 -fixed-vo'
alias clearall="clear && printf '\e[3J'"
alias fbm='node /home/nichobi/build/fb-messenger-cli/cli.js'
alias fotd="fortune -n 301 -s 75% fortunes 25% wisdom"
alias g=git
alias generatefotd='fortune -n 301 -s 75% fortunes 25% wisdom > ~/.fotd/myfotd; cat ~/.fotd/myfotd'
alias hibernate='systemctl hibernate'
alias l=exa
alias la='exa -a'
alias lg='exa -lg'
alias ll='exa -l'
alias ls=exa
alias myfotd='cat ~/.fotd/myfotd'
alias oops='sudo "$BASH" -c "$(history -p !!)"'
alias pR="paru  -Qq  | fzf -m --preview 'cat <(paru -Si {1}) <(paru -Fl {1} | awk \"{print \$2}\")' | xargs -ro paru -Rsn"
alias pRe="paru -Qqe | fzf -m --preview 'cat <(paru -Si {1}) <(paru -Fl {1} | awk \"{print \$2}\")' | xargs -ro paru -Rsn"
alias pS="paru  -Slq | fzf -m --preview 'cat <(paru -Si {1}) <(paru -Fl {1} | awk \"{print \$2}\")' | xargs -ro paru -S"
alias rsync="rsync -hv --info=progress2"
alias tb="nc termbin.com 9999"
alias tmux='tmux -u'
alias updatemusicfolder="ssh mir 'beet alt update lossy' && rsync -thr --no-i-r --progress mir:/mnt/data/MusicLossy/ ~/Music/ --delete"
alias webcamdisable='sudo modprobe -r uvcvideo'
alias webcamenable='sudo modprobe uvcvideo'
alias wget='wget --content-disposition'
alias screenmirrorx11='SDL_VIDEODRIVER=x11 wf-recorder -c rawvideo -m sdl -f pipe:wayland-mirror'
alias screenmirrorwayland='SDL_VIDEODRIVER=wayland wf-recorder -c rawvideo -m sdl -f pipe:wayland-mirror'

alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'

