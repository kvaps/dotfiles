if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?* ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

export XDG_CURRENT_DESKTOP=KDE
xscreensaver -nosplash &
nm-applet &
columeicon &
cbatticon &
volumeicon &
blueman-applet &
dropbox &
exec awesome
