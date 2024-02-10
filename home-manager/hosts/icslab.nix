{ config, pkgs, ... }:

{
  imports = [ ../packages.nix ../fonts.nix ../default.nix ];

  home.username = "icslab";
  home.homeDirectory = "/home/icslab";
}
