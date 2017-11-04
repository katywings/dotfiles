### Load bashrc files
# Local stuff, is not in version control
[[ -s ~/.bash_profile_local ]] && source ~/.bash_profile_local

# bashrc doesnt get loaded in login shells by default (https://stackoverflow.com/questions/7780030/how-to-fix-terminal-not-loading-bashrc-on-os-x-lion)
[[ -s ~/.bashrc ]] && source ~/.bashrc

# This was already here since some time ¯\_(ツ)_/¯
[[ -s ~/.profile ]] && source ~/.profile

