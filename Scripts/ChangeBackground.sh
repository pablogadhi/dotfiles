#!/bin/bash

while true
do
    # Set Wallpaper
    wal -a 65 -i "/home/gadhi/Pictures/cyberpunk/" -n
    feh --bg-fill "$(< "${HOME}/.cache/wal/wal")"

    # Set bspwm colors
    . "${HOME}/.cache/wal/colors.sh"
    bspc config normal_border_color "$color1"
    bspc config active_border_color "$color1"
    bspc config focused_border_color "$color15"
    bspc config presel_feedback_color "$color2"

    # Set kitty colors
    terminals=$(kitty @ --to=unix:/tmp/mykitty ls | jq .[].id)
    for i in ${terminals}; do
        kitty @ --to=unix:/tmp/mykitty set-colors -a -c --match id:${i} ${HOME}/.cache/wal/colors-kitty.conf
    done

    sleep 5m
done
