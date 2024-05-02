{ pkgs, catppuccin-mako, ... }:
let
  extra = builtins.readFile ./extraConfig;
  mocha = builtins.readFile "${catppuccin-mako}/src/mocha";
in {
  services.mako = {
    enable = true;
    extraConfig = ''
      ${extra}
      ${mocha}
    '';
  };
}
