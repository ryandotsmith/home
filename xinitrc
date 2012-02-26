#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# Before we start xfce, do these things:
syndaemon -t -k -i 2 -d &

# screen powersave
xset +dpms
xset dpms 0 0 300

# start xfce
exec ck-launch-session startxfce4
