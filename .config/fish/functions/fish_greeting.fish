function fish_greeting
	if status is-login; or test $GPG_TTY = /dev/pts/1
		fortune -as
	end
end
