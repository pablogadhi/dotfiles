#!/bin/bash

files='.eslintrc .Xresources .zshrc'
directories='aurman bspwm nvim polybar ranger rofi sxhkd wal'

for file in $files 
do 
    cp ~/$file ./
done

for dir in $directories
do
    cp -r ~/.config/$dir ./.config/
done

echo Backup Done!
