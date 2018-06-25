# Colors for solarized terminals
set -l base03  "--bold black"
set -l base02  "black"
set -l base01  "--bold green"
set -l base00  "--bold yellow"
set -l base0   "--bold blue"
set -l base1   "--bold cyan"
set -l base2   "white"
set -l base3   "--bold white"
set -l yellow  "yellow"
set -l orange  "--bold red"
set -l red     "red"
set -l magenta "magenta"
set -l violet  "--bold magenta"
set -l blue    "blue"
set -l cyan    "cyan"
set -l green   "green"

# Used by fish's completion; see
# http://fishshell.com/docs/2.0/index.html#variables-color
set -g fish_color_normal      $base0
set -g fish_color_command     $base0
set -g fish_color_quote       $cyan
set -g fish_color_redirection $base0
set -g fish_color_end         $base0
set -g fish_color_error       $red
set -g fish_color_param       $blue
set -g fish_color_comment     $base01
set -g fish_color_match       $cyan
set -g fish_color_search_match "--background=$base02"
set -g fish_color_operator    $orange
set -g fish_color_escape      $cyan

# Used by fish_prompt
set -g fish_color_host $cyan
set -g fish_color_cwd $yellow
set -g fish_color_git $green

# Set the cursor shape for vi modes
set fish_cursor_default block blink
set fish_cursor_insert line blink
set fish_cursor_replace_one underscore blink
set fish_cursor_visual block

# full paths in pwd prompt
set fish_prompt_pwd_dir_length 0

# git prompt settings
set __fish_git_prompt_show_informative_status 1
set __fish_git_prompt_showcolorhints 1

fish_hybrid_key_bindings

# Set the LS_COLORS variable
eval (dircolors -c "$HOME/.config/dircolors-solarized/dircolors.256dark")
