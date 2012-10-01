#!/bin/bash

SCM_THEME_PROMPT_DIRTY=" ${bold_red}✘"
SCM_THEME_PROMPT_CLEAN=" ${bold_green}✔"
SCM_THEME_PROMPT_PREFIX=" "
SCM_THEME_PROMPT_SUFFIX=" "
SCM_NONE_CHAR=""

rvmrc_version_prompt () {
  if [ -f .rvmrc ]; then
    if which rvm &> /dev/null; then
      rvm=$(rvm tools identifier) || return
      echo -e "\\xe2\\x98\\x85 $rvm "
    fi
  fi
}

# \[\033[G\]: goto first col
PROMPT=$'\\[\033[G\\]\\[${bold_yellow}\\]\w \\[${bold_red}\\]$(rvmrc_version_prompt)\\[${bold_blue}\\]$(scm_char)$(scm_prompt_info)\\[${reset_color}\\]\\[\e[0m\\]\n\xe2\x86\x92 '
