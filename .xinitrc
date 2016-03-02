#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

# add custom config for Urxvt or other programs using Xresource
xrdb ~/.Xresources

export SSH_AUTH_SOCK=$XDG_RUNTIME_DIR/ssh-agent.socket

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

/usr/bin/VBoxClient-all # might need an & ?

# exec gnome-session
# exec startkde
# exec startxfce4
# exec awesome
# ...or the Window Manager of your choice
exec $1
