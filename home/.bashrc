# If not running interactively, don't do anything (from ubuntu)
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options (from ubuntu)
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it (from ubuntu)
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1) (from ubuntu)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.(from ubuntu)
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories. (from ubuntu)
# globstar option doesnt exist in osx, so i silenced the output
shopt -s globstar &> /dev/null

# make less more friendly for non-text input files, see lesspipe(1) (from ubuntu)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

### Because why not?
alias python="python3"
alias pip="pip3"

### MySQL
export PATH=$PATH:MYSQL=/usr/local/mysql/bin

### Composer
export PATH=$PATH:~/.composer/vendor/bin

### Docker
# When this is enabled there always happens this error:
# Error checking TLS connection: Host is not running
# type docker-machine &> /dev/null && eval "$(docker-machine env default)"

### Ocaml
# https://github.com/ocaml/opam-repository/issues/7593#issuecomment-282534517
export CDPATH=.
type opam &> /dev/null && eval "$(opam config env)"

### RVM
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
PATH=$PATH:/usr/local/rvm/bin # Add RVM to PATH for scripting

### NVM
export NVM_DIR="$HOME/.nvm"
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
else
	# Tested on osx
	export CLICOLOR=YES
	export LSCOLORS="Gxfxcxdxbxegedabagacad"
fi


### LS Aliases (from ubuntu)
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
