{
  # source: https://www.drakerossman.com/blog/wayland-on-nixos-confusion-conquest-triumph
  # enable sway
  hardware.opengl = {
    enable = true; # when using QEMU KVM
  };
  security.polkit.enable = true;
}
