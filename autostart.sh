#!/bin/bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

run /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1
run numlockx on

feh --bg-fill /run/media/shaquibimdad/Shaquib/wallpapers/walls/WIDESCREEN-2K-FREE-21.04.02210130-by-@WALLSBYJFL.jpg
#run applications from startup
#run spotify
#run ckb-next -b
#run discord
#run telegram-desktop
