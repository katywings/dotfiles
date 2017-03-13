Dependencies:

- `homeshick` - Installation is OS depending (https://github.com/andsens/homeshick/wiki/Installation)
- `dein.vim`- (https://github.com/Shougo/dein.vim)
    - `curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh`
    - `sh installer.sh ~/.dein-vim`
    - `In Neovim: :call dein#install()`
- `tmux`- Installation is OS depending (apt-get / brew install / etc.)
- Only on osx (Hint: https://evertpot.com/osx-tmux-vim-copy-paste-clipboard/):
    - `brew install reattach-to-user-namespace`
- `thefuck` - (https://github.com/nvbn/thefuck)
    - `sudo -H pip install thefuck`
- `fish` - Installation is OS depending (http://fishshell.com/)
    - on linux: add `ln -s /usr/bin/fish /usr/local/bin/fish`
    - (This is because MacOSX has a different bin path for fish, than UNIX)
- `oh my fish` - See (https://github.com/oh-my-fish/oh-my-fish)
    - `curl -L http://get.oh-my.fish | fish`
    - `omf install`
- `pip3 install neovim`
- `npm install -g tern`

