{ pkgs, ... }: {
  # source: https://nixos.wiki/wiki/Bluetooth#Enabling_Bluetooth_support
  # enable bluetooth
  hardware.bluetooth = {
    enable = true; # enables support for Bluetooth
    powerOnBoot = true; # powers up the default Bluetooth controller on boot
  };

  # source: https://nixos.wiki/wiki/Sway#Brightness_and_volume
  # set up brightness
  programs.light.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [ git vim wget curl ];

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # source: https://nixos.wiki/wiki/Sway#Swaylock_cannot_be_unlocked_with_the_correct_password
  # enable PAM for swaylock
  security.pam.services.swaylock = { };

  # source: https://nixos.wiki/wiki/Fcitx5#Setup
  # enable vietnames input method
  services.xserver.desktopManager.runXdgAutostartIfNone = true;
  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.addons = with pkgs; [ fcitx5-unikey ];
  };

  # source: https://nixos.wiki/wiki/Firefox#Screen_Sharing_under_Wayland
  # enable xdg desktop integration for screen sharing
  xdg = {
    portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-wlr
        xdg-desktop-portal-gtk
      ];
      config.common.default = "*";
    };
  };
}
