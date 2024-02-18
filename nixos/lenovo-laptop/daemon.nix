{ pkgs, ... }:
let
  username = "tiendat";
in {
  # enable bluetooth
  hardware.bluetooth = {
    enable = true; # enables support for Bluetooth
    powerOnBoot = true; # powers up the default Bluetooth controller on boot
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${username} = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" "video" ];
    # packages = with pkgs;
    #   [
    #     # firefox
    #     # thunderbird
    #   ];
  };

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

  # enable PAM for swaylock
  security.pam.services.swaylock = { };

  # better battery for laptop
  powerManagement.enable = true;
  powerManagement.powertop.enable = true;
  services.thermald.enable = true;
  services.tlp = {
    enable = true;
    settings = {
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

      CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
      CPU_ENERGY_PERF_POLICY_ON_AC = "performance";

      CPU_MIN_PERF_ON_AC = 0;
      CPU_MAX_PERF_ON_AC = 100;
      CPU_MIN_PERF_ON_BAT = 0;
      CPU_MAX_PERF_ON_BAT = 20;

      #Optional helps save long term battery health
      START_CHARGE_THRESH_BAT0 = 40; # 40 and bellow it starts to charge
      STOP_CHARGE_THRESH_BAT0 = 80; # 80 and above it stops charging

    };
  };

  # enable vietnames input method
  services.xserver.desktopManager.runXdgAutostartIfNone = true;
  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.addons = with pkgs; [ fcitx5-unikey ];
  };

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

  # reset devices list after reboot 
  systemd.services.reset-input-devices= {
    serviceConfig = {
      ExecStart = 
        let
          script = pkgs.writeScript "reset-input-devices" ''
          #!${pkgs.runtimeShell}
          # Reset the keyboard driver and USB mouse 
                  
          modprobe -r atkbd
          modprobe atkbd reset=1
          echo "Finished resetting the keyboard."
                  
          # Reset every USB device, because we don't know in advance which port
          # the mouse is plugged into. Send errors to /dev/null to avoid 
          # cluttering up the logs.
          for USB in /sys/bus/usb/devices/*/authorized; do
              eval "echo 0 > $USB" 2>/dev/null 
              eval "echo 1 > $USB" 2>/dev/null
          done
          echo "Finished resetting USB inputs."
          '';
        in "${script}";
    };
  };
}
