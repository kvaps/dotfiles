
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?* ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

xrandr --output HDMI1 --auto --primary --output HDMI3 --auto --right-of HDMI1
xscreensaver -nosplash &
exec awesome
