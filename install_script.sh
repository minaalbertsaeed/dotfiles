#!/bin/dash
:<<'TODO'

TODO






echo "Authored by "
echo "███╗   ███╗██╗███╗  ██╗ █████╗"
echo "████╗ ████║██║████╗ ██║██╔══██╗"
echo "██╔████╔██║██║██╔██╗██║███████║"
echo "██║╚██╔╝██║██║██║╚████║██╔══██║"
echo "██║ ╚═╝ ██║██║██║ ╚███║██║  ██║"

echo 
echo 
echo 
echo "###################################################################################################################################################"
echo "##                                                                                                                                               ##"
echo "## Be careful, this script does not back up the configs on your system. Please back up your data and read the entire script before executing it. ##"
echo "##                                                                                                                                               ##"
echo "###################################################################################################################################################"
echo 
echo 
echo 

# Constants
DOTFILES_PARENT="$HOME/repos"
DOTFILES_PATH="$DOTFILES_PARENT/dotfiles"
DOTFILES_URL="https://github.com/minaalbertsaeed/dotfiles.git"

# Clone the minaalbertsaeed/dotfiles repo
if [ ! -d "$DOTFILES_PARENT" ]; then
    echo "--> Directory $DOTFILES_PARENT does not exist."
    echo "--> Creating directory: $DOTFILES_PARENT"

    echo "--> Executing: mkdir \"$DOTFILES_PARENT\""
    mkdir "$DOTFILES_PARENT"

    if [ $? -eq 0 ]; then
        echo "--> Successfully created $DOTFILES_PARENT."
    else
        echo "--> Failed to create $DOTFILES_PARENT. Please check permissions."
        exit 1
    fi
else
    echo "--> Directory $DOTFILES_PARENT already exists. Skipping creation."
fi
echo "--> Cloning my dotfiles repo to $DOTFILES_PATH... "
# git clone $DOTFILES_URL $DOTFILES_PATH

# check if git is installted 
# pacman -S needed - < 
