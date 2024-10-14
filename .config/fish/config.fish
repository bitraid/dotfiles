if test -t 0
	set fish_cursor_default block
	set fish_cursor_insert line
	set fish_cursor_replace_one underscore
	set fish_cursor_visual block blink
	fish_hybrid_key_bindings
end

if status is-login
	set -gx EDITOR nvim
	set -gx SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)
	eval (dircolors -c "$HOME/.config/dircolors-solarized/dircolors.256dark")
end

if status is-interactive
	set -x GPG_TTY (tty)
end
