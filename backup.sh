#!/bin/bash

homeFiles='.eslintrc.json .Xresources .zshrc Scripts'
confDirFiles='yay bspwm nvim polybar ranger rofi sxhkd wal compton.conf kitty'

for file in $homeFiles 
do 
    cp -r ~/$file ./
done

for dir in $confDirFiles
do
    cp -r ~/.config/$dir ./.config/
done

echo Backup Done!
