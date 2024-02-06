{ config, ... }:
let 
  symlink = config.lib.file.mkOutOfStoreSymlink;
in {
  # link file 
  home.file."./.config/waybar/theme.css" = {
    source = symlink ./theme.css;
  };
  
  programs.waybar = {
    enable = true;
    style = (import ./custom_style.css);
    settings = [(import ./settings.nix)];
  };
}
