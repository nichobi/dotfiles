# nichobi's dotfiles
## Configuration files for my Arch Linux setup.
This is my setup Wayland enviroment based around Sway as the window manager, Alacritty as a terminal, and neovim as an editor.

Dotfiles are managed with [pilgo](https://startpage.com/sp/search?query=pilgo), according to the setup in [pilgo.yml](pilgo.yml).

## Included dotfiles
The repo contains configs for the following software:
* [Alacritty](https://github.com/alacritty/alacritty): Terminal emulator
* [Paru](https://github.com/Morganamilo/paru): AUR helper and pacman wrapper
* [qutebrowser](https://github.com/qutebrowser/qutebrowser): Keyboard driven, Vim-like browser
* [Sway](https://github.com/swaywm/sway): Tiling window manager for Wayland
  * [Flashfocus](https://github.com/tmux/tmux): Flash windows on focus change
  * [Mako](https://github.com/emersion/mako): Notfication Daemon
  * [Waybar](https://github.com/Alexays/Waybar): Status bar
* [Zathura](https://github.com/pwmt/zathura): Document viewer
* [neovim](https://github.com/neovim/neovim): Modal editor forked off of vim
* [tmux](https://github.com/tmux/tmux): Terminal multiplexer
* [zsh](https://www.zsh.org/): Shell
  * [ohmyzsh](https://github.com/ohmyzsh/ohmyzsh): Framework for zsh configuration
* A few more minor config files are also included

## Setup
Run `./dotfileinstall`
Directory names can be provided as args to only install certain dotfiles.
