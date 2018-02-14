# ~/.zshrc
# vim:filetype=zsh
#


# Source grml config
source "$HOME/.src.d/grml-etc-core/etc/zsh/zshrc"
#


# Update fpath and autoload functions
[[ -d "$HOME/.zfunctions" ]] && \
	fpath=("$HOME/.zfunctions" "${fpath[@]}") && \
	autoload -Uz $HOME/.zfunctions/*(:t)
#


# Set Editor
export EDITOR="nvim"
#


# Aliases
alias cfgit="/usr/bin/git --git-dir=$HOME/.cfgit/ --work-tree=$HOME"
alias vim="/usr/bin/nvim"
alias vimdiff="/usr/bin/nvim -d"
alias phantomjs="env QT_QPA_PLATFORM= phantomjs"
#


# Suffix aliases
alias -s avi="mpv"
alias -s mp4="mpv"
#


# History settings
setopt EXTENDED_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS

HISTSIZE=5000
SAVEHIST=10000
#


# Keys setup
bindkey -v

bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word

zle-keymap-select () { [[ $TERM = "linux" || $MC_SID ]] || \
	( [[ $KEYMAP = vicmd ]] && echo -ne "\e[2 q" || echo -ne "\e[6 q" ) }

zle-line-init () { zle -K viins }

zle -N zle-line-init
zle -N zle-keymap-select

export KEYTIMEOUT=1
#


# Set pure prompt
promptinit
[[ $TERM = "linux" || $SSH_TTY ]] && PURE_PROMPT_SYMBOL='>'
prompt pure
#


# Load dircolors
[[ $TERM = *256color ]] && \
	eval $(dircolors -b \
	"$HOME/.src.d/dircolors-solarized/dircolors.256dark") || \
	eval $(dircolors -b \
	"$HOME/.src.d/dircolors-solarized/dircolors.ansi-universal")

zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
#


# Autosuggestions
source "$HOME/.src.d/zsh-autosuggestions/zsh-autosuggestions.zsh"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='bg=black,fg=green,bold'
#


# Syntax highlighting
[[ $TERM = linux ]] || {
	typeset -A ZSH_HIGHLIGHT_STYLES

	ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=red'
	ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=yellow'
	ZSH_HIGHLIGHT_STYLES[alias]='fg=green'
	ZSH_HIGHLIGHT_STYLES[suffix-alias]='fg=blue'
	ZSH_HIGHLIGHT_STYLES[builtin]='fg=green'
	ZSH_HIGHLIGHT_STYLES[function]='fg=green'
	ZSH_HIGHLIGHT_STYLES[command]='fg=green'
	ZSH_HIGHLIGHT_STYLES[precommand]='fg=green,underline'
	ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=yellow'
	ZSH_HIGHLIGHT_STYLES[hashed-command]='fg=green'
	ZSH_HIGHLIGHT_STYLES[path]='fg=blue'
	ZSH_HIGHLIGHT_STYLES[path_pathseparator]='fg=yellow'
	ZSH_HIGHLIGHT_STYLES[path_prefix]='fg=magenta'
	ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]='fg=cyan'
	ZSH_HIGHLIGHT_STYLES[globbing]='fg=magenta,bold'
	ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=magenta,bold'
	ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='bold'
	ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='bold'
	ZSH_HIGHLIGHT_STYLES[back-quoted-argument]='fg=cyan,underline'
	ZSH_HIGHLIGHT_STYLES[back-quoted-argument-unclosed]='fg=red'
	ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=cyan'
	ZSH_HIGHLIGHT_STYLES[single-quoted-argument-unclosed]='fg=magenta'
	ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=cyan'
	ZSH_HIGHLIGHT_STYLES[double-quoted-argument-unclosed]='fg=magenta'
	ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]='fg=cyan'
	ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument-unclosed]='fg=magenta'
	ZSH_HIGHLIGHT_STYLES[rc-quote]='fg=red'
	ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=red,bold'
	ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]='fg=red'   
	ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]='fg=red'   
	ZSH_HIGHLIGHT_STYLES[assign]='fg=yellow'
	ZSH_HIGHLIGHT_STYLES[redirection]='fg=yellow'
	ZSH_HIGHLIGHT_STYLES[comment]='fg=green,bold'
	ZSH_HIGHLIGHT_STYLES[arg0]='fg=green'
	ZSH_HIGHLIGHT_STYLES[default]='none'

	ZSH_HIGHLIGHT_STYLES[bracket-level-1]='fg=cyan,bold'
	ZSH_HIGHLIGHT_STYLES[bracket-level-2]='fg=yellow,bold'
	ZSH_HIGHLIGHT_STYLES[bracket-level-3]='fg=blue,bold'
	ZSH_HIGHLIGHT_STYLES[bracket-level-4]='fg=green,bold'

	ZSH_HIGHLIGHT_STYLES[cursor]='bg=black'

	ZSH_HIGHLIGHT_STYLES[root]='standout'

	ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets cursor root)
}
source "$HOME/.src.d/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
#


# History substring search
source "$HOME/.src.d/zsh-history-substring-search/zsh-history-substring-search.zsh"

bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
#
