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

install_script() {
  # Download the script and save it to /usr/local/bin
  curl -fsSL "$GITHUB_URL" -o "$TARGET_PATH"

  if [ $? -eq 0 ]; then
    echo -e "${FMT_YELLOW}$SCRIPT_NAME${FMT_RESET}${FMT_RESET} version ${FMT_CYAN}$VERSION${FMT_RESET} installed successfully at ${FMT_YELLOW}$TARGET_PATH${FMT_RESET}."
  else
    echo -e "${FMT_RED}Failed to install ${FMT_YELLOW}$SCRIPT_NAME${FMT_RESET}. Please check your permissions.${FMT_RESET}"
    exit 1
  fi
}

# Check if the script already exists
if [ -f "$TARGET_PATH" ]; then
  # Extract the semantic version number
  INSTALLED_VERSION=$(grep -oP 'VERSION="\K[0-9]+\.[0-9]+\.[0-9]+' "$TARGET_PATH")

  if grep -qE "^VERSION=\"$VERSION\"" "$TARGET_PATH"; then
    echo -e "The most recent version $INSTALLED_VERSION is already installed at ${FMT_YELLOW}$TARGET_PATH${FMT_RESET}."
  else
    echo -e "${FMT_CYAN}A new version of ${FMT_RESET}${FMT_YELLOW}$SCRIPT_NAME${FMT_RESET} ${FMT_CYAN}($VERSION -> $INSTALLED_VERSION) exists${FMT_RESET}"

    read -p "Do you want to upgrade? (Y/N): " confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] || exit 1

    install_script
  fi
else
  echo -e "${FMT_YELLOW}$SCRIPT_NAME${FMT_RESET} is not installed."

  # Download the script and save it to /usr/local/bin
  curl -fsSL "$GITHUB_URL" -o "$TARGET_PATH"

  # if [ $? -eq 0 ]; then
  #   echo -e "${FMT_YELLOW}$SCRIPT_NAME${FMT_RESET}${FMT_RESET} version ${FMT_CYAN}$VERSION${FMT_RESET} installed successfully at ${FMT_YELLOW}$TARGET_PATH${FMT_RESET}."
  # else
  #   echo -e "${FMT_RED}Failed to install ${FMT_YELLOW}$SCRIPT_NAME${FMT_RESET}. Please check your permissions.${FMT_RESET}"
  #   exit 1
  # fi

  install_script
fi
