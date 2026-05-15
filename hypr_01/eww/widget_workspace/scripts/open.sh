#!/bin/bash

# echo "$TERM" | awk '{print $1}'

terminal="kitty"
shell="$SHELL"
execute="impala"

# $terminal -- $shell -c "$execute; exec $shell"
$terminal -- $shell -c "$execute"


