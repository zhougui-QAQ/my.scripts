#!/bin/bash

#dwm status
dwmblocks &

#compton -b
picom -b

#fcitx &

ibus-daemon -x -d

albert &

~/my.scripts/setWallpaper.sh &
