#!/bin/bash


terminal="kitty"
shell="$SHELL"
execute="impala"
# execute="touch /tmp/GPT.md & tgpt --provider pollinations -i --log /tmp/GPT.md"

# $terminal -- $shell -c "$execute; exec $shell"
$terminal -- $shell -c "$execute"


