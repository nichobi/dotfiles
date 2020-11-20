# nichobi metapackages
Metapackages collecting some of my most used packages. To see the full lists of packages each metapackage depends on, see the relevant `PKGBUILD` file.

## Repository
The packages are available in my personal repository. To use it, add the following lines to the end of `/etc/pacman.conf`
```
[nichobi]
Server = https://nip.isacsson.se/public/packagerepo/
SigLevel = PackageOptional
```

## Package list

### nichobi-base
Packages I expect to have on any Arch install, including zsh, neovim and pacman utilities. All other metapackages depend on this.

### nichobi-devel
Packages I use for Scala and Haskell development, with integration for neovim.

### nichobi-ideapad
Packages for my Lenovo Ideapad S540API, including drivers and utilities. It also depends on nichobi-sway for the graphical environment.

### nichobi-sway
Packages for my Sway setup and graphical environment. It includes essentials for my Sway setup as well as a few key applications (browser, video player, image viewer)

