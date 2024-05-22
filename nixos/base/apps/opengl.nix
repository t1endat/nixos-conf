{
  # source: https://www.drakerossman.com/blog/wayland-on-nixos-confusion-conquest-triumph
  # enable sway
  hardware.opengl = {
    enable = true; # when using QEMU KVM
    # source: https://github.com/vimjoyer/nixos-gaming-video
    driSupport = true;
    driSupport32Bit = true;
  };
  security.polkit.enable = true;
}
