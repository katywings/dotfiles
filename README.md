# Base

## Terminals:
- OSX: [iTerm](https://iterm2.com/)
    - `You have mail.`: read them with `mail`, delete them with `sudo rm /var/mail/$USER`
- Ubuntu: Terminal
- KDE: Konsole

# Terminal tools
- [z](https://github.com/rupa/z) (*Is included*)
- [ag](https://github.com/ggreer/the_silver_searcher) or [ack](https://beyondgrep.com/)

## Ubuntu
- [vim] `sudo apt-get install vim-gnome` use this for copy paste functionality)

## Homeshick
- [Help](https://github.com/andsens/homeshick/wiki/Installation)
- `git clone git://github.com/andsens/homeshick.git $HOME/.homesick/repos/homeshick`
- `homeshick clone katywings/dotfiles`

## Other things
### OSX
- [Caffeine](http://lightheadsw.com/caffeine/) or Lungo from [Setapp](https://setapp.com/de)
- [Alfred](https://www.alfredapp.com/)
- [Setapp](https://setapp.com/de)
    - Rocket Typist


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
