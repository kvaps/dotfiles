if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?* ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

export EDITOR="vim"
export BROWSER="firefox"
export QT_QPA_PLATFORMTHEME="qt5ct"

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources &
xrdb -merge ~/.Xresources && xscreensaver -nosplash &
nm-applet &
columeicon &
cbatticon &
volumeicon &
blueman-applet &
dropbox &
exec awesome
