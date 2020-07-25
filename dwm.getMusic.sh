#!/bin/sh

filter() { mpc | sed "/^volume:/d;s/\\&/&amp;/g;s/\\[paused\\].*/⏸/g;/\\[playing\\].*/d" | paste -sd ' ';}

pidof -x dwm.getMpd.sh >/dev/null 2>&1 || dwm.getMpd.sh >/dev/null 2>&1 &

case $BLOCK_BUTTON in
	1) mpc status | filter ; setsid -f "$TERMINAL" -e ncmpcpp ;;  # right click, pause/unpause
	3) mpc toggle | filter ;;  # right click, pause/unpause
	2) mpc status | filter ; notify-send "🎵 Music module" "\- Shows mpd song playing.
- ⏸ when paused.
- Left click opens ncmpcpp.
- Middle click pauses.
- Scroll changes track.";;  # right click, pause/unpause
	4) mpc prev   | filter ;;  # scroll up, previous
	5) mpc next   | filter ;;  # scroll down, next
	6) mpc status | filter ; "$TERMINAL" -e "$EDITOR" "$0" ;;
	*) mpc status | filter ;;
esac
