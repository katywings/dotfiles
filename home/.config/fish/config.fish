# Modify the terminal's 256 color palette to use the gruvbox theme
set -l GRUVBOX_SCRIPT ~/.dein-vim/repos/github.com/morhetz/gruvbox/gruvbox_256palette.sh
if test -f $GRUVBOX_SCRIPT
  bash $GRUVBOX_SCRIPT
end

set -g Z_SCRIPT_PATH ~/.bin/z.sh

set -g theme_nerd_fonts yes
set -g theme_color_scheme gruvbox
set -g theme_title_display_process yes
set -g theme_date_format "+%H:%M:%S"

# Path to Oh My Fish install.
set -q XDG_DATA_HOME
  and set -gx OMF_PATH "$XDG_DATA_HOME/omf"
  or set -gx OMF_PATH "$HOME/.local/share/omf"

# Load Oh My Fish configuration.
source $OMF_PATH/init.fish

set -gx fish_color_autosuggestion 665C54
set -gx fish_color_normal FBF1C7
set -gx fish_color_command 689D6A
set -gx fish_color_param normal
set -gx fish_color_end B16286
set -gx fish_color_redirection B16286

source "$HOME/.homesick/repos/homeshick/completions/homeshick.fish"
. "$HOME/.homesick/repos/homeshick/homeshick.fish"

set --universal fish_user_paths $fish_user_paths ~/.pub-cache/bin

function my_key_bindings
    fish_vi_key_bindings
    bind -M insert -m default jk force-repaint
end
set -g fish_key_bindings my_key_bindings

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish
