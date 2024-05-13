#!/bin/bash

# Replace 'filename' with the actual filename you want to make read-only
filename1="../flake.nix"
filename2="../home-manager/desktop-apps/firefox/firefox.nix"

# Check if the file exists
if [ ! -f "$filename1" ]; then
  echo "Error: File '$filename' does not exist!"
  exit 1
fi
if [ ! -f "$filename2" ]; then
  echo "Error: File '$filename' does not exist!"
  exit 1
fi

# Set read-only permission for the file owner (user)
chmod 400 "$filename1"
chmod 400 "$filename2"

# Optional: Inform the user about the success
echo "File '$filename1' set to read-only."
echo "File '$filename2' set to read-only."

exit 0


