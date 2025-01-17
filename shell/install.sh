#!/bin/bash

VERSION="1.0.0"

FMT_RESET='\033[0m' # Color Off
FMT_BLUE='\033[34m'
FMT_BOLD='\033[1m'
FMT_CYAN='\033[0;36m'
FMT_GREEN='\033[0;32m'
FMT_RED='\033[0;31m'
FMT_YELLOW='\033[0;33m'

# Define the target path
SCRIPT_NAME="install.sh"
TARGET_PATH="/home/$USER/$SCRIPT_NAME"
GITHUB_URL="https://raw.githubusercontent.com/aagamezl/experiments/master/shell/$SCRIPT_NAME"

function file_exist() {
  local file_path=$1

  local file_path=$1

  if [[ -e $file_path ]]; then
    # echo "The file '$file_path' exists."
    return 0
  else
    # echo "The file '$file_path' does not exist."
    return 1
  fi
}

if ! file_exist "${TARGET_PATH}"; then
  echo "${FMT_YELLOW}$SCRIPT_NAME${FMT_RESET} is not installed. Installing."
  curl -o "$TARGET_PATH" "$GITHUB_URL"
else
  echo "${FMT_YELLOW}${SCRIPT_NAME}${FMT_RESET} is already installed."

  exit 1
fi
