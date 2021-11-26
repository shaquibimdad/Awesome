#!/bin/bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

run /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1
run numlockx on
run nm-applet
feh --bg-scale $HOME/.config/awesome/wallpaper/wall.jpg
# Remap modifier keys when pressed alone
#xcape -e 'Control_L=Escape;Super_L=Hangul_Hanja;Super_R=Hangul'
#Other key remappings
xmodmap $HOME/.Xmodmap
#Faster key repeat response
xset r rate 200 30
#Compositor
# Night mode
#redshift-gtk -l 20:40

#Start ibus
#ibus-daemon -drx
#run applications from startup
#run spotify
#run ckb-next -b
#run discord
#run telegram-desktop
