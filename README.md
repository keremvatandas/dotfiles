# For Neovim

### Neovim 0.5+ / Luajit / luarocks

```language-bash
brew install lua
brew install luajit
brew install ripgrep
brew install ctags
brew install neovim
```


### Iterm Font
    - You are using agave Nerd Font


### NeoVim Conf


```language-bash
git clone https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

ln -s ~/dotfiles/nvim/ ~/.config/
```

### Tmux Conf

- You have to install Tmux Plugin Manager (https://github.com/tmux-plugins/tpm)

```language-bash
ln -s dotfiles/tmux/tmux.conf ~/.tmux.conf
tmux source ~/.tmux.conf

# Control a + I
```


