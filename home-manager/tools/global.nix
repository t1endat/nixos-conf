{ pkgs, ... }:

{
  home.packages = with pkgs; [
    python311 # python global

    gcc # cc global

    rustc # rust global
    cargo
    clippy
    rustfmt
    rust-analyzer
  ];
}
