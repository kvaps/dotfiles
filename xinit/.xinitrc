if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?* ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

export XDG_CURRENT_DESKTOP=KDE
xrandr --output HDMI2 --auto --output eDP1 --primary --auto --left-of HDMI2 &
xscreensaver -nosplash &
nm-applet &
columeicon &
cbatticon &
volumeicon &
blueman-applet &
dropbox &
exec awesome
