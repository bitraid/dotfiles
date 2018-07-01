# ~/.zshrc
# vim:filetype=zsh

# source grml config
source "${ZDOTDIR}/grml-etc-core/etc/zsh/zshrc"

# aliases and functions
alias gdf="/usr/bin/git --git-dir=${HOME}/.git --work-tree=${HOME}"
alias gdfl="/usr/bin/git --git-dir=${HOME}/.git --work-tree=${HOME} log --oneline"
alias gdfs="/usr/bin/git --git-dir=${HOME}/.git --work-tree=${HOME} status --short"
alias gdfmu="/usr/bin/git --git-dir=${HOME}/.git --work-tree=${HOME} submodule update --remote --merge"
gdfa() { /usr/bin/git --git-dir=${HOME}/.git --work-tree=${HOME} add "$@" }
alias vim='/usr/bin/nvim'
alias vimdiff='/usr/bin/nvim -d'

# suffix aliases
alias -s avi='mpv'
alias -s mp4='mpv'

# environment variables
export EDITOR='nvim'

# update fpath and load user functions
if [[ -d "${ZDOTDIR}/functions" ]]; then
  fpath=("${ZDOTDIR}/functions" "${fpath[@]}")
  autoload -Uz ${ZDOTDIR}/functions/*(:t)
fi

# set LS_COLORS
if [[ $TERM = *256color ]]; then
  eval $(dircolors -b "${HOME}/.config/dircolors-solarized/dircolors.256dark")
else
  eval $(dircolors -b "${HOME}/.config/dircolors-solarized/dircolors.ansi-universal")
fi
# use LS_COLORS for file completion
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# history settings
setopt EXTENDED_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
HISTSIZE=5000
SAVEHIST=10000

# keys setup - vi emulation
bindkey -v
# some emacs bindings
bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
# change cursor shape with vi mode switch
zle-keymap-select() {
  if [[ $TERM != 'linux' && -z $MC_SID ]]; then
    if [[ $KEYMAP = vicmd ]]; then
      echo -ne "\e[2 q"
    else
      echo -ne "\e[6 q"
    fi
  fi
}
zle-line-init() {
  zle -K viins
}
zle -N zle-line-init
zle -N zle-keymap-select
# wait 10ms for next key read
export KEYTIMEOUT=1

# pure prompt
promptinit
if [[ $TERM = 'linux' || -n $SSH_TTY ]]; then
  PURE_PROMPT_SYMBOL='>'
  PURE_GIT_DOWN_ARROW='+'
  PURE_GIT_UP_ARROW='^'
fi
prompt pure

# autosuggestions
source "${ZDOTDIR}/zsh-autosuggestions/zsh-autosuggestions.zsh"
if [[ $TERM != 'linux' ]]; then
  ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='bg=black,fg=green,bold'
fi

# syntax highlighting
if [[ $TERM != 'linux' ]]; then
  typeset -A ZSH_HIGHLIGHT_STYLES
# main
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
# brackets
  ZSH_HIGHLIGHT_STYLES[bracket-level-1]='fg=cyan,bold'
  ZSH_HIGHLIGHT_STYLES[bracket-level-2]='fg=yellow,bold'
  ZSH_HIGHLIGHT_STYLES[bracket-level-3]='fg=blue,bold'
  ZSH_HIGHLIGHT_STYLES[bracket-level-4]='fg=green,bold'
# cursor
  ZSH_HIGHLIGHT_STYLES[cursor]='bg=black'
# root
  ZSH_HIGHLIGHT_STYLES[root]='standout'
# choose highlighters
  ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets cursor root)
fi
source "${ZDOTDIR}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# history substring search
source "${ZDOTDIR}/zsh-history-substring-search/zsh-history-substring-search.zsh"
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# fzf 24-bit solarized colors
if [[ $TERM != 'linux' ]]; then
  export FZF_DEFAULT_OPTS='
    --color=bg+:#073642,bg:#002b36,spinner:#719e07,hl:#586e75
    --color=fg:#839496,header:#586e75,info:#cb4b16,pointer:#719e07
    --color=marker:#719e07,fg+:#839496,prompt:#719e07,hl+:#719e07
  '
fi

# source fzf
 source /usr/share/fzf/key-bindings.zsh
 source /usr/share/fzf/completion.zsh
