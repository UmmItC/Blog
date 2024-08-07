#!/bin/bash

# Define colors
GREEN='\033[0;32m'
GRAY='\033[1;30m'
DARKRED='\033[0;31m'
NC='\033[0m' # No Color

# Function for Hugo building
build_hugo() {
    echo -e "${GREEN}[+] Building Hugo site...${NC}"
    hugo --minify
    echo -e "${GREEN}[+] Hugo build complete.${NC}"
    rm -rfv .hugo_build.lock
}

valid_choice=false
do_hugo=false

while [ "$valid_choice" == false ]; do
    # Check if --noconfirm is passed as a command-line argument
    if [[ "$@" == *"--noconfirm"* ]]; then
        choice="y"
    else
        # Prompt user for confirmation
        read -p "Do you want to update Hugo site and submodules? [Y/n]: " choice
        choice=${choice:-y} # Default to 'yes' if user just presses Enter
    fi

    case "$choice" in 
        y|Y ) 
            # Update submodules recursively
            echo -e "${GREEN}[+] Updating submodules...${NC}"
            git submodule update --init --recursive --remote
            echo -e "${GREEN}[+] Updated submodules complete.${NC}"
            valid_choice=true
            do_hugo=true
            ;;
        n|N ) 
            echo -e "${GRAY}[~] No update performed.${NC}"
            valid_choice=true
            ;;
        * ) 
            echo -e "${DARKRED}[!] Invalid choice, please choose 'y' or 'n'.${NC}"
            ;;
    esac
done

# Build Hugo site after updating submodules if --hugo option is provided
if [ "$do_hugo" = true ]; then
    build_hugo
fi
