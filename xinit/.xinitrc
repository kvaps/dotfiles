if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?* ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

export EDITOR="vim"
export BROWSER="vivaldi-stable"
export QT_QPA_PLATFORMTHEME="qt5ct"

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources &
xrandr --output HDMI2 --auto --output eDP1 --primary --auto --left-of HDMI2 &
xscreensaver -nosplash &
nm-applet &
columeicon &
cbatticon &
volumeicon &
blueman-applet &
dropbox &
exec awesome
