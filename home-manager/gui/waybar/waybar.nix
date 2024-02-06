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
    style = ''
    @import "theme.css";

    * {
      /* reference the color by using @color-name */
      color: @text;
    }

    window#waybar {
      /* you can also GTK3 CSS functions! */
      background-color: shade(@base, 0.9);
      border: 2px solid alpha(@crust, 0.3);
    }
    '';
    settings = [(import ./settings.nix)];
  };
}
