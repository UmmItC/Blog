#!/bin/bash

# Define colors
GREEN='\033[0;32m'
GRAY='\033[1;30m'
DARKRED='\033[0;31m'
NC='\033[0m' # No Color

valid_choice=false

while [ "$valid_choice" == false ]; do
    # Prompt user for confirmation
    read -p "Do you want to update submodules? [Y/n]: " choice
    choice=${choice:-y} # Default to 'yes' if user just presses Enter
    case "$choice" in 
        y|Y ) 
            # Update submodules recursively
            echo -e "${GREEN}[+] Updating submodules...${NC}"
            git submodule update --init --recursive --remote
            valid_choice=true
            ;;
        n|N ) 
            echo -e "${GRAY}[~] No submodule update performed.${NC}"
            valid_choice=true
            ;;
        * ) 
            echo -e "${DARKRED}[!] Invalid choice, please choose 'y' or 'n'.${NC}"
            ;;
    esac
done
