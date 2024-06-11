{ pkgs, ... }:
let
  ROOT = builtins.toString ./.;
in 
{
  home.packages = with pkgs; [
    zellij # terminal workspace 
  ];

  home.file.".config/zellij/config.kdl" = {
    source = "${ROOT}/config.kdl";
  };
}
