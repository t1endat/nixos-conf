{ pkgs, ... }: {
  home.packages = with pkgs; [
    qemu # machine emulator
    # platformio # cross-platform embedded tool
    openocd # On-Chip Debugging
    gdb # The GNU Project debugger
    cargo-binutils # invoke the LLVM tools shipped
    cargo-generate # tool to generaet a new Rust project
  ];

  # source: https://nixos.wiki/wiki/Virt-manager
  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = [ "qemu:///system" ];
      uris = [ "qemu:///system" ];
    };
  };
}
