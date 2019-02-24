#!/bin/bash

killall -q ChangeBackgroun
while pgrep -u $UID -x ChangeBackgroun >/dev/null; do sleep 1; done
killall -q sleep
while pgrep -u $UID -x sleep >/dev/null; do sleep 1; done

/home/gadhi/Scripts/ChangeBackground.sh
