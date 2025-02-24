# Development Environment Setup Guide

This repository contains my personal development environment configurations, primarily focused on Neovim and Tmux setup.

## Prerequisites

### Required Tools

```bash
brew install lua
brew install luajit
brew install ripgrep
brew install ctags
brew install neovim
```

## Setup Instructions

### Neovim Configuration

1. Install Packer (Neovim Package Manager):

```bash
git clone https://github.com/wbthomason/packer.nvim \
    ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

2. Link Neovim configuration:

```bash
ln -s ~/dotfiles/nvim/ ~/.config/
```

### Tmux Configuration

1. Install [Tmux Plugin Manager (TPM)](https://github.com/tmux-plugins/tpm)

2. Link Tmux configuration:

```bash
ln -s dotfiles/tmux/tmux.conf ~/.tmux.conf
```

3. Apply configuration:

```bash
tmux source ~/.tmux.conf
```

4. Install plugins: Press `Ctrl + a` followed by `I` inside tmux session

## Terminal Setup

### Font Configuration

- Terminal is configured to use **Agave Nerd Font**
- Make sure to install this font for proper icon rendering

## Notes

- Requires Neovim 0.5 or higher
- Configurations are optimized for macOS but should work on most Unix-like systems
- All configurations are symlinked from the dotfiles directory

## License

Feel free to use and modify these configurations as you see fit.
