#!/bin/bash

# hyprctl dispatch submap reset

sleep   1

killall eww  
killall dunst 

sleep   1

rm      -rf     ~/.config/hypr/
mkdir   -p      ~/.config/hypr/
cp      -r      hypr_02/* ~/.config/hypr

~/.eww/target/release/eww -c ~/.config/hypr/eww/widget_inf_system daemon &
~/.eww/target/release/eww -c ~/.config/hypr/eww/widget_inf_system open widget_inf &


cp  starship_02.toml    ~/.config/starship.toml
cp  fuzzel_02.ini       ~/.config/fuzzel/fuzzel.ini
cp  dunstrc_02          ~/.config/dunst/dunstrc
cp  kitty_02.conf       ~/.config/kitty/kitty.conf
dunst &


hyprctl reload
hyprctl setcursor Moga-Neon-Water 30 


