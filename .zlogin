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

# Start the X server (use 'exec startx' to logout on exit)
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && sway || fortune -as
