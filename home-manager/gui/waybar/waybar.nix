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
    settings = [{
      "layer" = "top";
      "modules-left" = [ "sway/workspaces" ];
      "modules-center" = [ "sway/window" ];
      "modules-right" = [ "network" "pulseaudio" "battery" "clock" ];
      "sway/window" = {
        "max-length" = 50;
      };

      "network"= {
          # "interface": "wlp2*", // (Optional) To force the use of this interface
          "format-wifi"= "{essid} ({signalStrength}%) ";
          "format-ethernet"= "{ipaddr}/{cidr} ";
          "tooltip-format"= "{ifname} via {gwaddr} ";
          "format-linked"= "{ifname} (No IP) ";
          "format-disconnected"= "Disconnected ⚠";
          "format-alt"= "{ifname}: {ipaddr}/{cidr}";
          "on-click-right"= "alacritty -e nmtui";
      };

      "pulseaudio"= {
          # "scroll-step": 1, // %, can be a float
          "format"= "{volume}% {icon} {format_source}";
          "format-bluetooth"= "{volume}% {icon} {format_source}";
          "format-bluetooth-muted"= " {icon} {format_source}";
          "format-muted"= " {format_source}";
          "format-source"= "{volume}% ";
          "format-source-muted"= "";
          "format-icons"= {
              "headphone"= "";
              "hands-free"= "";
              "headset"= "";
              "phone"= "";
              "portable"= "";
              "car"= "";
              "default"= ["" "" ""];
          };
          "on-click-right"= "pavucontrol";
      };

      "battery"= {
          "states"= {
              # "good": 95,
              "warning"= 30;
              "critical"= 15;
          };
          "format"= "{capacity}% {icon}";
          "format-charging"= "{capacity}% ";
          "format-plugged"= "{capacity}% ";
          "format-alt"= "{time} {icon}";
          # // "format-good": ""; // An empty format will hide the module
          # // "format-full": "";
          "format-icons"= ["" "" "" "" ""];
      };

      "clock"= {
          "calendar"= {
            "mode"          = "months";
            "mode-mon-col"  = 3;
            "weeks-pos"     = "right";
            "on-scroll"     = 1;
            "on-click-right"= "mode";
            "format"= {
              "days"=       "<span color='#ecc6d9'><b>{}</b></span>";
              "weeks"=      "<span color='#99ffdd'><b>W{}</b></span>";
              "weekdays"=   "<span color='#ffcc66'><b>{}</b></span>";
              "today"=      "<span color='#ff6699'><b><u>{}</u></b></span>";
            };
          };
          "format"= "{:%H:%M}  ";
          "format-alt"= "{:%A, %B %d, %Y (%R)}";
          "tooltip-format"= "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
      };

    }];
  };
}
