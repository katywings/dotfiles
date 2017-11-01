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

### Set colors if possible (copied from ubuntu original bashrc)
# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
	debian_chroot=$(cat /etc/debian_chroot)
fi

case "$TERM" in
	xterm-color|*-256color) color_prompt=yes;;
esac

if [ "$color_prompt" = yes ]; then
	PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
	PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi

unset color_prompt

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
	test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
	alias ls='ls --color=auto'
	#alias dir='dir --color=auto'
	#alias vdir='vdir --color=auto'

	alias grep='grep --color=auto'
	alias fgrep='fgrep --color=auto'
	alias egrep='egrep --color=auto'
fi


### LS Aliases (from ubuntu)
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
