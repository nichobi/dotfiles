trunced_dir() {
  local pwd="${PWD/#$HOME/~}"
  pwd_list=(${(s:/:)pwd})
  pwd_size=${#pwd_list[@]}
  if [[ $pwd_size -gt 3 ]]; then
    shrink_path -4 -t -l -e …
  else
    echo $pwd
  fi
}

setopt promptsubst
PS1='%B%F{green}%n@%m%f%b:%B%F{blue}$(trunced_dir)%f%b$ '

