#!/bin/bash

# Define the target path
SCRIPT_NAME=$(basename $0)
TARGET_PATH="/usr/local/bin/$SCRIPT_NAME"
GITHUB_URL="https://raw.githubusercontent.com/aagamezl/experiments/master/shell/install.sh"

# Check if the script already exists
if [ -f "$TARGET_PATH" ]; then
  echo "shest is already installed at $TARGET_PATH."
else
  echo "Installing shest..."
  # Download the script and save it to /usr/local/bin
  curl -fsSL "$GITHUB_URL" -o "$TARGET_PATH"
  
  # Set execution permissions
  chmod +x "$TARGET_PATH"
  
  if [ $? -eq 0 ]; then
    echo "shest installed successfully at $TARGET_PATH."
  else
    echo "Failed to install shest. Please check your permissions."
    exit 1
  fi
fi
