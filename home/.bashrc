### RVM
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
PATH=$PATH:/usr/local/rvm/bin # Add RVM to PATH for scripting

### NVM
export NVM_DIR="/Users/katja/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

### Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

### Homeshick (https://github.com/andsens/homeshick)
source "$HOME/.homesick/repos/homeshick/homeshick.sh"
# Bash completion
source "$HOME/.homesick/repos/homeshick/completions/homeshick-completion.bash"

### Z (https://github.com/rupa/z)
[ -s "$HOME/.config/bash/z.sh" ] && . "$HOME/.config/bash/z.sh"
