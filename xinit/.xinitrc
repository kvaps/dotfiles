if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?* ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

xscreensaver -nosplash &
nm-applet &
columeicon &
cbatticon &
volumeicon &
blueman-applet &
dropbox &
exec awesome
