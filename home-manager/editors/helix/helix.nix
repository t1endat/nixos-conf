{ pkgs, ... }:
let
ROOT = builtins.toString ./.;
{
  home.packages = with pkgs; [
    # helix editor
    helix
  ];

  # minimal config for helix
  home.file.".config/config.toml" = {
    source = ${ROOT}/config.toml;
  };
}
