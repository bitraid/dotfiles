# ~/.zlogin
# vim:filetype=zsh

export XKB_DEFAULT_LAYOUT="us,gr"
export XKB_DEFAULT_OPTIONS="grp:alt_shift_toggle,caps:swapescape"

export GDK_BACKEND="wayland"
export QT_QPA_PLATFORM="wayland-egl"
export QT_WAYLAND_DISABLE_WINDOWDECORATION="1"
export CLUTTER_BACKEND="wayland"
export SDL_VIDEODRIVER="wayland"
export ECORE_EVAS_ENGINE="wayland_egl"
export ELM_ENGINE="wayland_egl"

# start sway (use 'exec sway' to logout on exit)
[[ -z $DISPLAY && $(tty) = /dev/tty1 ]] && sway || fortune -as
