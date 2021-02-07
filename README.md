.dotfiles
===

Use `stow` for dotfiles management:
```shell
$ pacman -S stow
```

On new machine:
```shell
cd $HOME
git clone https://github.com/galvanic/dotfiles
cd dotfiles
```

```shell
yay -S oh-my-zsh-git
```

In order:
```shell
stow urxvt
stow git
stow vim
stow shell ## needs oh-my-zsh install
stow zsh
stow i3
```

```shell
chsh -s `which zsh`
```

TODO put virtualenv configs into dotfiles (eg. postactivate, postdeactivate, etc.)
