#!/bin/bash
# Kayden's Bash Profile script
# Install into your home directory
# Include posh git in the .bashrc file
# https://webcache.googleusercontent.com/search?q=cache:YX95e_CZcisJ:https://github.com/lyze/posh-git-sh+&cd=1&hl=en&ct=clnk&gl=us
# https://raw.githubusercontent.com/lyze/posh-git-sh/master/git-prompt.sh

source ~/.bashrc

export COLOR_NC='\e[0m' # No Color
export COLOR_BLACK='\e[0;30m'
export COLOR_GRAY='\e[1;30m'
export COLOR_RED='\e[0;31m'
export COLOR_LIGHT_RED='\e[1;31m'
export COLOR_GREEN='\e[0;32m'
export COLOR_LIGHT_GREEN='\e[1;32m'
export COLOR_BROWN='\e[0;33m'
export COLOR_YELLOW='\e[1;33m'
export COLOR_BLUE='\e[0;34m'
export COLOR_LIGHT_BLUE='\e[1;34m'
export COLOR_PURPLE='\e[0;35m'
export COLOR_LIGHT_PURPLE='\e[1;35m'
export COLOR_CYAN='\e[0;36m'
export COLOR_LIGHT_CYAN='\e[1;36m'
export COLOR_LIGHT_GRAY='\e[0;37m'
export COLOR_WHITE='\e[1;37m'

export PROMPT_COMMAND='__posh_git_ps1 "${COLOR_LIGHT_GREEN}\u@\h${COLOR_NC}:${COLOR_LIGHT_BLUE}\w" "${COLOR_NC}\\\$ ";'$PROMPT_COMMAND