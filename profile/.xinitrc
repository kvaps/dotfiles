if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?* ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

[[ -f ~/.xprofile ]] && . .xprofile

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

exec awesome
