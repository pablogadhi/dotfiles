#!/bin/bash

while true
do
    wal -a 70 -i "/home/gadhi/Pictures/cyberpunk/" -n
    feh --bg-fill "$(< "${HOME}/.cache/wal/wal")"
    . "${HOME}/.cache/wal/colors.sh"
    bspc config normal_border_color "$color1"
    bspc config active_border_color "$color1"
    bspc config focused_border_color "$color15"
    bspc config presel_feedback_color "$color2"
    sleep 5m
done
