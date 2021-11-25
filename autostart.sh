#!/bin/bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

run /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1
run numlockx on

feh --bg-fill $HOME/.config/awesome/wallpaper/wall.jpg
#run applications from startup
#run spotify
#run ckb-next -b
#run discord
#run telegram-desktop
