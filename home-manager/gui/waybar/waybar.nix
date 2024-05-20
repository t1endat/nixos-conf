{ config, catppuccin-waybar, ... }:
{
  # link file 
  home.file.".config/waybar/mocha.css" = {
    # source = symlink ./mocha.css; 
    source = "${catppuccin-waybar}/themes/mocha.css";
  };

  programs.waybar = {
    enable = true;
    settings = [ (import ./settings.nix) ];
    style = builtins.readFile ./style.css;
  };
}
