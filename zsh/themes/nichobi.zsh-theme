trunced_dir() {
  local pwd="${PWD/#$HOME/~}"
  pwd_list=(${(s:/:)pwd})
  pwd_size=${#pwd_list[@]}
  if [[ $pwd_size -gt 3 ]]; then
    echo $(shrink_path -4 -t -l -e …)
  else
    echo $pwd
  fi
}
#PROMPT='$fg[green]%n@%m$reset_color:$fg[blue]$(trunced_dir)$reset_color$ '
PROMPT='%F{green}%n@%m%f:%F{blue}$(trunced_dir)%f$ '
