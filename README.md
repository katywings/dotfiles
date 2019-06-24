# Base

## Terminals:
- OSX: [iTerm](https://iterm2.com/)
    - `You have mail.`: read them with `mail`, delete them with `sudo rm /var/mail/$USER`
    - Profile: General: Working Directory: "Reuse previous sessions directory"
- Ubuntu: Terminal
- KDE: Konsole

### Tools
- [z](https://github.com/rupa/z) (*Is included*)
- [ag](https://github.com/ggreer/the_silver_searcher) or [ack](https://beyondgrep.com/)

### Homeshick
- [Help](https://github.com/andsens/homeshick/wiki/Installation)
- `git clone git://github.com/andsens/homeshick.git $HOME/.homesick/repos/homeshick`
- `source "$HOME/.homesick/repos/homeshick/homeshick.sh"`
- `homeshick clone katywings/dotfiles`

### SSH Key
(https://www.digitalocean.com/community/tutorials/how-to-set-up-ssh-keys--2)

```bash
# RSA
ssh-keygen -t rsa -b 4096
# ed25519
ssh-keygen -t ed25519
```

### Ubuntu
- vim `sudo apt-get install vim-gtk3` use this for "copy paste"-functionality) (vim-gnome works too)
- ag `sudo apt install silversearcher-ag`

### OSX
- vim `brew install vim` use this for copy paste functionality

## Other things
- [Atom](https://atom.io)
  - Syntax theme: `gruvbox-plus-syntax`

### OSX
- [Caffeine](http://lightheadsw.com/caffeine/) or Lungo from [Setapp](https://setapp.com/de)
- [Alfred](https://www.alfredapp.com/)
- [Spectacle](https://github.com/eczarny/spectacle)
- [Setapp](https://setapp.com/de)
    - Rocket Typist
- [Screenshot Path](https://discussions.apple.com/docs/DOC-9081): `$ defaults write com.apple.screencapture location /path/`

### Ubuntu

- Add applications to gnome3 application menu: https://askubuntu.com/questions/79583/adding-custom-applications-to-gnome-launcher
  - See `.config/kw-resources/gnome3/desktop-files` for examples
