#!/bin/bash

# hyprctl dispatch submap reset

sleep   1

killall eww  
killall dunst 

sleep   1

rm      -rf     ~/.config/hypr/
mkdir   -p      ~/.config/hypr/
cp      -r      hypr_01/* ~/.config/hypr

~/.eww/target/release/eww -c ~/.config/hypr/eww/widget_inf_system daemon &
~/.eww/target/release/eww -c ~/.config/hypr/eww/widget_inf_system open widget_inf &

~/.eww/target/release/eww -c ~/.config/hypr/eww/widget_workspace daemon &
~/.eww/target/release/eww -c ~/.config/hypr/eww/widget_workspace open widget_workspace &



cp  starship_01.toml    ~/.config/starship.toml
cp  fuzzel_01.ini       ~/.config/fuzzel/fuzzel.ini
cp  dunstrc_01          ~/.config/dunst/dunstrc
cp  kitty_01.conf       ~/.config/kitty/kitty.conf
cp  btop_01.conf       ~/.config/btop/btop.conf
dunst &


hyprctl reload
hyprctl setcursor oreo_white_cursors 30 
# hyprpm  reload 

bash    -c  ~/.config/hypr/random_imagen.sh


