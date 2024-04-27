{ pkgs, pkgs-unstable, ... }:

{
  home.packages = [
    # (python311.withPackages (ps: with ps; [ ])) # python global
    pkgs.python311
    pkgs.gcc # cc global
    pkgs.rustc # rust global
    pkgs.cargo
    pkgs.clippy
    pkgs.rustfmt
    pkgs-unstable.rust-analyzer
  ];
}
