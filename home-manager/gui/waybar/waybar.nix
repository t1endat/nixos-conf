{ config, ... }:
let 
  symlink = config.lib.file.mkOutOfStoreSymlink;
in {
  # link file 
  home.file.".config/waybar/theme.css" = {
    source = symlink ./theme.css;
  };
  
  programs.waybar = {
    enable = true;
    settings = [(import ./settings.nix)];
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
    
    tooltip {
      background: @surface0;
    }
    
    #pulseaudio {
      background-color: @surface0;
      border-radius: 5px;
    }
    #network {
      background-color: @surface1;
      border-radius: 5px;
    }
    #bluetooth {
      background-color: @surface2;
      border-radius: 5px;
    }

    #clock {
      background-color: @surface0;
      border-radius: 5px;
    }

    #window {
      background-color: @surface0;
      border-radius: 5px;
    }
    
    #workspaces {
        margin: 0 4px;
    }
    #workspaces button {
      padding: 0 5px;
    } 
    #workspaces button.focused {
      background-color: @surface0;
    }
    '';
  };
}
