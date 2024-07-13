# Define the filenames as an array
filenames=(
  "../nixos/base/preset.nix"
  "../nixos/dell-pc/hardware-configuration.nix"
  "../nixos/lenovo-laptop/hardware-configuration.nix"
  "../flake.nix"
  "../home-manager/desktop-apps/firefox/firefox.nix"
  "../nixos/base/hosts/extra-hosts"
  "../nixos/base/hosts/social-hosts"
  "../nixos/base/hosts/workmode-hosts"
  "../nixos/base/hosts/hosts.nix"
  "../nixos/lenovo-laptop/systemd.nix"
  "../nixos/lenovo-laptop/reset-input-devices.sh"
)

# Loop through each filename in the array
for filename in "${filenames[@]}"; do
  # Check if the file exists
  if [ ! -f "$filename" ]; then
    echo "Error: File '$filename' does not exist!"
    continue  # Skip to the next iteration if file doesn't exist
  fi

  # Set read-only permission (400) for the file owner
  chmod 400 "$filename"
  echo "File '$filename' set to read-only."
done

exit 0
