# .zshenv
# vim:filetype=zsh

if [[ -z $XDG_CONFIG_HOME ]]; then
  export XDG_CONFIG_HOME="${HOME}/.config"
fi

if [[ -d "${XDG_CONFIG_HOME}/zsh" ]]; then
  export ZDOTDIR="${XDG_CONFIG_HOME}/zsh"
elif [[ -d "${HOME}/.config/zsh" ]]; then
  export ZDOTDIR="${HOME}/.config/zsh"
fi

if [[ -f "${ZDOTDIR}/grml-etc-core/etc/zsh/zshenv" ]]; then
  source "${ZDOTDIR}/grml-etc-core/etc/zsh/zshenv"
fi
