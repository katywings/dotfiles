# Base

- Font: [Inconsolata (or Inconsolata-G) Powerline](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Inconsolata)
  - Most terminals need the mono font (try that first)

- Terminal: iTerm or ROXTerm
  - Terminal Theme: [Gruvbox](https://github.com/morhetz/gruvbox-contrib)

- `tmux`- Installation is OS depending (apt-get / brew install / etc.)

# Terminal tools

- `fish` - Installation is OS depending (http://fishshell.com/)
    - on linux: add `sudo ln -s /usr/bin/fish /usr/local/bin/fish`
    - (This is because MacOSX has a different bin path for fish, than UNIX)
- `oh my fish` - See (https://github.com/oh-my-fish/oh-my-fish)
    - `curl -L http://get.oh-my.fish | fish`
    - `omf install`
- `homeshick` - Installation is OS depending (https://github.com/andsens/homeshick/wiki/Installation)
- `thefuck` - (https://github.com/nvbn/thefuck)
    - `sudo -H pip install thefuck`
- `[ag](https://github.com/ggreer/the_silver_searcher)`

# Neovim and some shenanigans 
> (probably will switch to a more lightweight vim config itf)

- `dein.vim`- (https://github.com/Shougo/dein.vim)
    - `curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh`
    - `sh installer.sh ~/.dein-vim`
    - `In Neovim: :call dein#install()`
- `xclip`!
- Only on osx (Hint: https://evertpot.com/osx-tmux-vim-copy-paste-clipboard/):
    - `brew install reattach-to-user-namespace`
- `sudo pip2 install neovim`
- `sudo pip3 install neovim`
- `sudo npm install -g tern`
