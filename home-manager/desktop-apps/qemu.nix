{ pkgs, ... }: {
  home.packages = with pkgs; [
    qemu # better machine emulator
  ];
  
  # source: https://nixos.wiki/wiki/Virt-manager
  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = ["qemu:///system"];
      uris = ["qemu:///system"];
    };
  };
}
