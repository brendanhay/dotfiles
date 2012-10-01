#!/bin/bash

# Load colors first so they can be use in base theme
source "${BASH}/themes/colors.theme.bash"
source "${BASH}/themes/base.theme.bash"

# Load Library
LIB="${BASH}/lib/*.bash"
for config_file in $LIB
do
  source $config_file
done

# Load Tab Completion
COMPLETION="${BASH}/completion/*.bash"
for config_file in $COMPLETION
do
  source $config_file
done

# Load Plugins
PLUGINS="${BASH}/plugins/*.bash"
for config_file in $PLUGINS
do
  source $config_file
done

unset config_file

# Set the prompt
if [[ $PROMPT ]]; then
  export PS1=$PROMPT
fi

# Preview
PREVIEW="less"
[ -s /Applications/Preview.app ] && PREVIEW="/Applications/Preview.app"
