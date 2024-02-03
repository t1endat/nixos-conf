{ pkgs, ... }:
{
  imports = [
    ./firefox/firefox.nix
  ];

  home.packages = with pkgs; [
    discord
    blender
  ];
}

