HISTFILE=$ZCACHEDIR/history
HISTSIZE=10000
SAVEHIST=10000

setopt extended_history       # ': <beginning time>:<elapsed seconds>;<command>'
setopt hist_ignore_all_dups   # Remove older duplicate entries from history
setopt hist_ignore_space      # Ignore commands that begin with a space
setopt hist_reduce_blanks     # Remove superfluous blanks from history items
setopt inc_append_history     # Save history entries as soon as they are entered
setopt share_history          # Share history between zsh instances
