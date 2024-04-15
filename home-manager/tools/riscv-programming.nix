{ pkgs, ... }: {
  home.packages = with pkgs; [
    ripes # GUI simulator for RISC-V ISA
  ];
}
