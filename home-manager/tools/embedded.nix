{ pkgs, ... }: {
  home.packages = with pkgs; [
    qemu # machine emulator
    platformio # cross-platform embedded tool
  ];

  # source: https://nixos.wiki/wiki/Virt-manager
  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = [ "qemu:///system" ];
      uris = [ "qemu:///system" ];
    };
  };
}
