# For Neovim

### Neovim 0.5+ / Luajit / luarocks

```language-bash
brew install --HEAD neovim
# or
brew upgrade neovim --fetch-HEAD

brew install --HEAD luajit
```

### luarock for telescope

```language-bash
luarocks install telescope
```

### Iterm Font
    - You have to use NERD or Powerline Fonts  [for icon problems]


### Golang Packages and PATH Settings

- https://gist.github.com/keremvatandas/f447787a1bbd60b9a04f927ebc0e315b


### Tmux Conf

- You have to install Tmux Plugin Manager (https://github.com/tmux-plugins/tpm)


```language-bash
ln -s dotfiles/tmux/tmux.conf ~/.tmux.conf
tmux source ~/.tmux.conf

# Control a + I 
```


### Preview Tmux and Nvim

![alt text](https://raw.githubusercontent.com/keremvatandas/dotfiles/master/images/nvim0.png "Nvim Dashboard")

![alt text](https://raw.githubusercontent.com/keremvatandas/dotfiles/master/images/nvim1.png "Nvim Dashboard")
