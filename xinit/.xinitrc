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
nm-applet &
columeicon &
cbatticon &
kmix &
blueman-applet &
dropbox &
syncthing-gtk -ms &
exec awesome
