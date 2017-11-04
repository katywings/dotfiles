### Load bashrc files
# Local stuff, is not in version control
[[ -s ~/.bash_profile_local ]] && source ~/.bash_profile_local

# bashrc doesnt get loaded in login shells by default (https://stackoverflow.com/questions/7780030/how-to-fix-terminal-not-loading-bashrc-on-os-x-lion)
[[ -s ~/.bashrc ]] && source ~/.bashrc

# This was already here since some time ¯\_(ツ)_/¯
[[ -s ~/.profile ]] && source ~/.profile

### Because why not?
alias python="python3"
alias pip="pip3"

### MySQL
export PATH=$PATH:MYSQL=/usr/local/mysql/bin

### Composer
export PATH=$PATH:~/.composer/vendor/bin

### NVM
. ~/.nvm/nvm.sh

### Docker
# When this is enabled there always happens this error:
# Error checking TLS connection: Host is not running
# type docker-machine &> /dev/null && eval "$(docker-machine env default)"

### Ocaml
# https://github.com/ocaml/opam-repository/issues/7593#issuecomment-282534517
export CDPATH=.
type opam &> /dev/null && eval "$(opam config env)"
