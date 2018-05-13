#!/bin/bash
######################################
# Configuration
######################################
DIR="$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
LIB_DIR=${DIR}/lib

REPO_URL="git@personal:giftedprimate/math_bot.git"

######################################
# Include dependencies
######################################
source ${LIB_DIR}/colors.sh
source ${LIB_DIR}/deployment.sh

######################################
# Command help 
######################################
function cmd_help() {
  echocyan "USAGE: $0 COMMAND"; echo; echo
  echocyan "COMMAND"; echo
  echocyan "[ca|clone-app] <version>  ... Clones version from master repo"; echo
  echocyan "[ap|app-parts] <version>  ... Adds required missing files to app"; echo
  echocyan "[ba|build-app] <version>  ... Builds snapshot for deployment"; echo
  echocyan "[st|start-app] <version>  ... Starts app in background"; echo
  echocyan "[-h|-help] 	              ... Shows this help menu"; echo
}

case "$1" in
  ca|clone-app)
    if [ -z "$2" ]; then
      cmd_help; exit
    else 
      cloneApp $2
    fi
  ;;
  ap|add-parts)
    if [ -z "$2" ]; then
      cmd_help; exit
    else 
      addMissingParts $2
    fi
  ;;
  ba|build-app)
    if [ -z "$2" ]; then
      cmd_help; exit
    else 
      buildApp $2
    fi
  ;;
  st|start-app)
    if [ -z "$2" ]; then
      cmd_help; exit
    else 
      startApp $2
    fi
  ;;
  -h|--help|*)
    cmd_help; exit
  ;;
esac
