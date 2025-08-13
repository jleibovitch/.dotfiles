#!/bin/sh

# ====================================================================
# This script uses GNU Stow to create symbolic links for multiple dotfiles
# from a managed directory into the user's home directory.
#
# Prerequisite: You need to have Stow installed.
#
# Directory Structure:
# ~/dotfiles/
# ├── zsh/
# │   └── .zshrc
# ├── git/
# │   └── .gitconfig
# ├── plugins/
# │   ├── zsh.sh (optional post-stow script for zsh)
# │   └── nvim.sh (optional post-stow script for nvim)
# └── ... (other dotfiles)
#
# Usage:
# 1. Place this script inside your ~/.dotfiles/ directory.
# 2. Make sure your dotfiles are organized as shown above.
# 3. Make the script executable: chmod +x install.sh
# 4. Run it with the folder names as arguments:
#    ./install.sh zsh git nvim
# ====================================================================


STOW_DIR="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
pushd $STOW_DIR

echo "Checking for GNU Stow..."
# Check if stow is installed
if ! command -v stow &> /dev/null; then
    echo "GNU Stow not found. Please install it first."
    # Provide installation instructions for common systems
    echo "On Debian/Ubuntu: sudo apt-get install stow"
    echo "On Fedora: sudo dnf install stow"
    echo "On macOS with Homebrew: brew install stow"
    exit 1
fi

echo "Stow found. Proceeding with installation."

# Check if any arguments were provided.
if [ "$#" -eq 0 ]; then
    echo "No folders specified. Usage: ./install.sh <folder1> <folder2> ..."
    exit 1
fi


# Loop through all arguments passed to the script.
for folder_name in "$@"; do

    if [ "$folder_name" = "plugins" ]; then
        echo "Plugins is not allowed to be stowed"
	continue
    fi

    # Use an early return pattern: if the folder doesn't exist, skip to the next one.
    if [ ! -d "$folder_name" ]; then
        echo "Folder '$folder_name' not found. Skipping."
        continue
    fi

    echo "Attempting to install symlinks for '$folder_name'..."

    # Unlink any existing symlinks for this folder before stowing again.
    # This ensures a clean slate and avoids potential conflicts.
    # The command's output is redirected to /dev/null to keep the output clean.
    stow -D "$folder_name" &> /dev/null
    stow "$folder_name"

    # Use an early return pattern to check the exit status of stow.
    if [ $? -ne 0 ]; then
        echo "An error occurred while stowing '$folder_name'. Please check the output above."
        echo ""
        continue
    fi

    echo "Symlinks for '$folder_name' created successfully."

    # Now, check for and run a corresponding plugin script in the `plugins` folder.
    # The script name should match the folder name with a .sh extension.
    PLUGIN_SCRIPT="$STOW_DIR/plugins/$folder_name.sh"
    echo $PLUGIN_SCRIPT
    if [ -x "$PLUGIN_SCRIPT" ]; then
        echo "Found plugin script for '$folder_name'. Executing..."
	echo ""
	echo ""
	echo "==============START====================="
	echo ""
	echo ""
        "$PLUGIN_SCRIPT"
	echo ""
	echo ""
	echo "==============DONE======================"
	echo ""
	echo ""
    fi
done

echo "All specified stow operations have been attempted."
popd

