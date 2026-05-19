#!/bin/bash


terminal="kitty"
shell="$SHELL"
execute="btop"
# execute="touch /tmp/GPT.md & tgpt --provider pollinations -i --log /tmp/GPT.md"

# $terminal -- $shell -c "$execute; exec $shell"
$terminal -- $shell -c "$execute"


