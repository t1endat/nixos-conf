#!/bin/bash

#requirement step for atuin
atuin_folder="~/.local/share/atuin/"

if [ ! -d "$atuin_folder" ]; then
  echo "Error: Folder '$atuin_folder' does not exist!"
  mkdir "$atuin_folder"
  atuin init nu | save "$atuin_folder"
  
  echo "Successfully init for atuin"
  exit 1
fi

# Optional: Inform the user about the success
echo "Already init for atuin"
exit 0



