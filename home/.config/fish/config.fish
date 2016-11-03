source "$HOME/.homesick/repos/homeshick/completions/homeshick.fish"
. "$HOME/.homesick/repos/homeshick/homeshick.fish"

# Modify the terminal's 256 color palette to use the gruvbox theme
set -l GRUVBOX_SCRIPT ~/.dein-vim/repos/github.com/morhetz/gruvbox/gruvbox_256palette.sh
if test -f $GRUVBOX_SCRIPT
  bash $GRUVBOX_SCRIPT
end
