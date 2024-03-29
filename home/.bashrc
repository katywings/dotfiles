# If not running interactively, don't do anything (from ubuntu)
case $- in
    *i*) ;;
      *) return;;
esac

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Change the window title of X terminals
case ${TERM} in
       xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|interix|konsole*)
               PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\007"'
               ;;
       screen*)
               PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\033\\"'
               ;;
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

export LANG=en_US.UTF-8

### Disable OSX zsh warning (https://www.addictivetips.com/mac-os/hide-default-interactive-shell-is-now-zsh-in-terminal-on-macos/)
export BASH_SILENCE_DEPRECATION_WARNING=1

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi

export CHROME_EXECUTABLE=/usr/bin/chromium

### Homebrew
export PATH="/usr/local/sbin:$PATH"

### Custom NPM bin path
export PATH=$PATH:~/.npm-global/bin

### Dart sdk bin path
export PATH=$PATH:/opt/dart-sdk/bin

### Pub (dart) bin path
export PATH=$PATH:~/.pub-cache/bin

### Clang
export PATH=/opt/clang/bin:$PATH

### Rust
export PATH="$HOME/.cargo/bin:$PATH"

### MySQL
export PATH=$PATH:MYSQL=/usr/local/mysql/bin

### Composer
export PATH=$PATH:~/.composer/vendor/bin

### Elixir (Erlang)
export PATH=$PATH:/opt/elixir/bin

### Deno
export DENO_INSTALL="/home/katja/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

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

### Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

### Go binaries
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/go/bin

if [ -x "$(command -v podman)" ]; then
  export DOCKER_HOST=unix:///run/user/$UID/podman/podman.sock
fi

### asdf (https://asdf-vm.com)
[ -s "$HOME/.asdf/asdf.sh" ] && . $HOME/.asdf/asdf.sh

### Homeshick (https://github.com/andsens/homeshick)
source "$HOME/.homesick/repos/homeshick/homeshick.sh"
# Bash completion
source "$HOME/.homesick/repos/homeshick/completions/homeshick-completion.bash"

### Set colors if possible (copied from ubuntu original bashrc)
# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
	debian_chroot=$(cat /etc/debian_chroot)
fi

# For now this is not required
# if [ -n "$DISPLAY" -a "$TERM" == "xterm" ]; then
#     export TERM=xterm-256color
# fi

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

alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias np='nano -w PKGBUILD'
alias more=less
alias gd='git diff --color-words=.'       # human-readable git diff
alias gb="git for-each-ref --sort=committerdate refs/heads/ --format='%(color: red)%(committerdate:short) %(color: cyan)%(refname:short)'" # git branches sorted by date
gta() {
  git tag -a $1 -m $1
}
ford() {
  for D in *; do
    if [ -d "${D}" ]; then
      cd "${D}"
      eval $*;
      cd ..;
    fi
  done
}
# https://stackoverflow.com/a/1872007
cdu () {
  cd "${PWD%/$1/*}/$1";
}
sdocs() {
  NOTES_DIR=$HOME/Projects/docs
  NOTES_STATUS=`git -C $NOTES_DIR status --porcelain`
  if [ ${#NOTES_STATUS} -ne 0 ]
  then
    git -C $NOTES_DIR add --all
    git -C $NOTES_DIR commit -m "$NOTES_STATUS"
    git -C $NOTES_DIR pull --rebase
    git -C $NOTES_DIR push
  else
    git -C $NOTES_DIR pull --rebase
  fi
}

# Use brew version of vim if installed
[ -s "/usr/local/bin/vim" ] && alias vim='/usr/local/bin/vim'

# Use gtk version of vim if installed
[ -s "/usr/bin/vim.gtk3" ] && alias vim='/usr/bin/vim.gtk3'

# Vscode
[ -s "/Applications/Visual Studio Code.app" ] && alias code='open -a "/Applications/Visual Studio Code.app"'

[ -s "/usr/share/vscodium-bin/bin/codium" ] && alias code='/usr/share/vscodium-bin/bin/codium'

# Disable opencollective
# https://github.com/opencollective/opencollective-postinstall
export DISABLE_OPENCOLLECTIVE=true

### Include bash aliases file
# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Bash won't get SIGWINCH if another process is in the foreground.
# Enable checkwinsize so that bash will check the terminal size when
# it regains control.  #65623
# http://cnswww.cns.cwru.edu/~chet/bash/FAQ (E11)
shopt -s checkwinsize

# Default parameter to send to the "less" command
# -R: show ANSI colors correctly; -i: case insensitive search
LESS="-R -i"

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi
# bash completion with sudo
complete -cf sudo

# Add sbin directories to PATH.  This is useful on systems that have sudo
[ -z "${PATH##*/sbin*}" ] || PATH=$PATH:/sbin:/usr/sbin

#
# # ex - archive extractor
# # usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

export EDITOR=vim

# better yaourt colors
export YAOURT_COLORS="nb=1:pkg=1:ver=1;32:lver=1;45:installed=1;42:grp=1;34:od=1;41;5:votes=1;44:dsc=0:other=1;35"

# Start ssh-agent (https://wiki.archlinux.org/index.php/SSH_keys#SSH_agents)
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent > ~/.ssh-agent-thing
fi
if [[ ! "$SSH_AUTH_SOCK" ]]; then
    eval "$(<~/.ssh-agent-thing)" > /dev/null;
fi

# Local stuff, is not in version control
[[ -s ~/.bashrc_local ]] && source ~/.bashrc_local

[[ -s $HOME/.asdf/asdf.sh ]] && . $HOME/.asdf/asdf.sh
[[ -s $HOME/.asdf/completions/asdf.bash ]] && . $HOME/.asdf/completions/asdf.bash

# Recover cwd for new terminal tabs in Gnome
[[ -s /etc/profile.d/vte.sh ]] && source /etc/profile.d/vte.sh
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

### Z old (https://github.com/rupa/z)
# [ -s "$HOME/.config/bash/z.sh" ] && . "$HOME/.config/bash/z.sh"

### Z new (https://github.com/skywind3000/z.lua)
eval "$(lua $HOME/.config/lua/z.lua --init bash)"

