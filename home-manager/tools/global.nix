{ pkgs, ... }:

{
  home.packages = with pkgs; [
    (python311.withPackages (ps: with ps; [ ])) # python global
    rustup # rust global
    gcc # cc global
  ];
}
