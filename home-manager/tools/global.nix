{ pkgs, pkgs-unstable, ... }:

{
  home.packages = [
    pkgs.python311 # python global
    
    pkgs.gcc # cc global
    
    pkgs.rustc # rust global
    pkgs.cargo
    pkgs.clippy
    pkgs.rustfmt
    pkgs-unstable.rust-analyzer
    
    pkgs.go # go global
  ];
}
