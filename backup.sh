#!/bin/bash

homeFiles='.eslintrc.json .Xresources .zshrc Scripts'
confDirFiles='aurman bspwm nvim polybar ranger rofi sxhkd wal compton.conf'

for file in $homeFiles 
do 
    cp -r ~/$file ./
done

for dir in $confDirFiles
do
    cp -r ~/.config/$dir ./.config/
done

echo Backup Done!
