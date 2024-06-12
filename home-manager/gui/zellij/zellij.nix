{ pkgs, ... }:
let
  ROOT = builtins.toString ./.;
in 
{
  home.packages = with pkgs; [
    zellij # terminal workspace 
  ];

  # config file
  home.file.".config/zellij/config.kdl" = {
    source = "${ROOT}/config.kdl";
  };

  # layout and swap layout
  home.file.".config/zellij/layouts" = {
    source = "${ROOT}/layouts";
  };

}
