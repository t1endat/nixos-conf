{ pkgs, ... }:
let
  extra = builtins.readFile ./extraConfig;
in {
  services.mako = {
    enable = true;
    extraConfig = ''
      ${extra}
    '';
  };
}
