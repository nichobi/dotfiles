autoload -Uz compinit
compinit -d $ZCACHEDIR/compdump
zmodload zsh/complist
autoload bashcompinit && bashcompinit

setopt always_to_end # move cursor to end if word had one match
setopt auto_list # automatically list choices on ambiguous completion
#setopt auto_menu # automatically use menu completion
setopt complete_in_word
setopt menu_complete # Use menu complete instantly

zstyle ':completion:*' group-name '' # group results by category
#zstyle ':completion:::::' completer _expand _complete _ignored
zstyle ':completion:*' menu select
zstyle ':completion:*' completer _complete
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+l:|=* r:|=*'
zstyle ':completion:*' insert-tab false # Complete even on empty lines

# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# preview directory's content with eza when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
# switch group using `,` and `.`
zstyle ':fzf-tab:*' switch-group 'ctrl-h' 'ctrl-l'

# use vi navigation keys in menu completion
# Not necessary with fzf-tab
#bindkey -M menuselect '^h' vi-backward-char
#bindkey -M menuselect '^k' vi-up-line-or-history
#bindkey -M menuselect '^l' vi-forward-char
#bindkey -M menuselect '^j' vi-down-line-or-history

# On demand rehash of completion, when packages have changed
# https://wiki.archlinux.org/index.php/Zsh#On-demand_rehash
zshcache_time="$(date +%s%N)"

autoload -Uz add-zsh-hook
rehash_precmd() {
  if [[ -a /var/cache/zsh/pacman ]]; then
    local paccache_time="$(date -r /var/cache/zsh/pacman +%s%N)"
    if (( zshcache_time < paccache_time )); then
      rehash
      zshcache_time="$paccache_time"
    fi
  fi
}
add-zsh-hook -Uz precmd rehash_precmd

