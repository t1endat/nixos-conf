{ pkgs, ... }:
let
  tuigreet = "${pkgs.greetd.tuigreet}/bin/tuigreet";
  session = "${pkgs.sway}/bin/sway";
  # username = "tiendat";
in {
  # source: https://nixos.wiki/wiki/Steam#Install
  # gaming
  programs.steam = {
    enable = true;
    remotePlay.openFirewall =
      true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall =
      true; # Open ports in the firewall for Source Dedicated Server
  };

  # source: https://nixos.wiki/wiki/VirtualBox#VirtualBox_Oracle_Extensions 
  # virtualbox
  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = [ "user-with-access-to-virtualbox" ];

  # source: https://www.drakerossman.com/blog/wayland-on-nixos-confusion-conquest-triumph
  # enable sway
  hardware.opengl.enable = true; # when using QEMU KVM
  security.polkit.enable = true;

  # source: https://nixos.wiki/wiki/KDE#GTK_themes_are_not_applied_in_Wayland_applications_.2F_Window_Decorations_missing_.2F_Cursor_looks_different
  # for gtk apps
  programs.dconf.enable = true;

  # displayManager
  services.greetd = {
    enable = true;
    settings = {
      # initial_session = {
      #   command = "${session}";
      #   user = "${username}";
      # };
      default_session = {
        command =
          "${tuigreet} --greeting 'Welcome to NixOS!' --asterisks --remember --remember-user-session --time -cmd ${session}";
        user = "greeter";
      };
    };
  };

  # bluetooth
  services.blueman.enable = true;

  # source: https://nixos.wiki/wiki/Thunar
  # thunar file manager
  programs.thunar = {
    enable = true;
    plugins = with pkgs.xfce; [ thunar-archive-plugin thunar-volman ];
  };
  # other functionalities for nixos
  services.gvfs.enable = true; # Mount, trash, and other functionalities
  services.tumbler.enable = true; # Thumbnail support for images
}
