
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?* ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

export XDG_CURRENT_DESKTOP=KDE
xrandr --output HDMI1 --auto --output HDMI3 --auto --primary --right-of HDMI1
xscreensaver -nosplash &
dropbox &
xinput --set-prop "kvaps - мышь" "Device Accel Constant Deceleration" 1.7  &
exec awesome
