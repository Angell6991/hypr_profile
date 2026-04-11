#!/bin/bash

# hyprctl dispatch submap reset

sleep   1

killall eww  
killall mako 

sleep   1

rm      -rf     ~/.config/hypr/
mkdir   -p      ~/.config/hypr/
cp      -r      hypr_01/* ~/.config/hypr


~/.eww/target/release/eww -c ~/.config/hypr/eww/widget_hours daemon 
~/.eww/target/release/eww -c ~/.config/hypr/eww/widget_hours open widget_hours 

~/.eww/target/release/eww -c ~/.config/hypr/eww/widget_buttons daemon 
~/.eww/target/release/eww -c ~/.config/hypr/eww/widget_buttons open bar-window  

~/.eww/target/release/eww -c ~/.config/hypr/eww/widget_inf_system daemon 
~/.eww/target/release/eww -c ~/.config/hypr/eww/widget_inf_system open widget_inf 

cp  starship_01.toml    ~/.config/starship.toml
cp  fuzzel_01.ini       ~/.config/fuzzel/fuzzel.ini
cp  config_mako_01      ~/.config/mako/config
cp  kitty_01.conf       ~/.config/kitty/kitty.conf
mako &

hyprctl reload
hyprctl setcursor oreo_pink_cursors 24 

