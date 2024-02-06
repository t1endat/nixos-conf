{
  "layer" = "top"; 
  "modules-left" = [ "sway/workspaces" "sway/window" ];
  "modules-center" = [ "clock" ];
  "modules-right" = [ "bluetooth" "network" "pulseaudio" "battery" ];
  
  "sway/window" = {
    "max-length" = 25;
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
  
  "bluetooth"= {
	"format"= " {status}";
	"format-connected"= " {device_alias}";
	"format-connected-battery"= " {device_alias} {device_battery_percentage}%";
	# // "format-device-preference": [ "device1", "device2" ], // preference list deciding the displayed device
	"tooltip-format"= "{controller_alias}\t{controller_address}\n\n{num_connections} connected";
	"tooltip-format-connected"= "{controller_alias}\t{controller_address}\n\n{num_connections} connected\n\n{device_enumerate}";
	"tooltip-format-enumerate-connected"= "{device_alias}\t{device_address}";
	"tooltip-format-enumerate-connected-battery"= "{device_alias}\t{device_address}\t{device_battery_percentage}%";
    "on-click-right"= "blueman-manager";
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
          "warning"= 30;
          "critical"= 15;
      };
      "format"= "{capacity}% {icon}";
      "format-charging"= "{capacity}% ";
      "format-plugged"= "{capacity}% ";
      "format-alt"= "{time} {icon}";
      "format-icons"= ["" "" "" "" ""];
  };
  
}
