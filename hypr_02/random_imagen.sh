#!/bin/bash


# Ruta a la carpeta con wallpapers
WALLPAPER_DIR="$HOME/Images/.wallpaper/profile_02/"

# Selecciona una imagen aleatoria (ajusta extensión si tienes otros formatos)
WALLPAPER=$(find "$WALLPAPER_DIR" -type f \( -iname '*.jpg' -o -iname '*.png' \) | shuf -n 1)


# tipos de transitions 
TYPE_LIST=("simple" "outer" "center" "wipe" "top" "bottom" "left" "right")
TYPE=${TYPE_LIST[$(( RANDOM % ${#TYPE_LIST[@]} ))]}


# positions transitions
POS_LIST=("0,0" "0.5,0.5" "0.999,0" "0.999,0.999" "0,0.999" "0.2,0.4" "0.8,0.8" "0.3,0.3")
POS=${POS_LIST[$(( RANDOM % ${#TYPE_LIST[@]} ))]}


# angle transitions
ANGLE_LIST=("30" "120" "210" "300" "15" "135" "225" "315")
ANGLE=${ANGLE_LIST[$(( RANDOM % ${#TYPE_LIST[@]} ))]}


# Poner el wallpaper con swww


if pgrep -x "awww-daemon" > /dev/null; then
    awww img "$WALLPAPER" --transition-type="$TYPE" --transition-pos="$POS" --transition-angle="$ANGLE" --transition-duration=2 &

else
    awww-daemon &
    awww img "$WALLPAPER" --transition-type="$TYPE" --transition-pos="$POS" --transition-angle="$ANGLE" --transition-duration=2 &

fi


