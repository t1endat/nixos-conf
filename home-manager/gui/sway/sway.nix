{ pkgs, ... }:
{
  home.packages = with pkgs; [
    autotiling # tiling behavior like hyprland
    swaylock # lock screen
  ];
  wayland.windowManager.sway = {
    enable = true;
    config = rec {
      modifier = "Mod4";
      terminal = "alacritty";
      bars = [{
        command = "waybar";
      }];
    };
    # TODO: change to relative path
    extraConfig = ''
      # custom keybinding
      bindsym Mod4+Shift+b exec 'firefox'

      # Brightness
      bindsym XF86MonBrightnessDown exec light -U 10
      bindsym XF86MonBrightnessUp exec light -A 10

      # Volume
      bindsym XF86AudioRaiseVolume exec 'wpctl set-volume @DEFAULT_AUDIO_SINK@ 10%+'
      bindsym XF86AudioLowerVolume exec 'wpctl set-volume @DEFAULT_AUDIO_SINK@ 10%-'
      bindsym XF86AudioMute exec 'wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle'

      # rofi
      bindsym Mod4+Shift+Return exec 'rofi -show drun'
      bindsym Mod4+Shift+d exec 'rofi -show run'

      # touchpad
      input "type:pointer" accel_profile flat
      input "type:touchpad" {
	      # enable tap to click
	      tap enable
	      natural_scroll enable
	      scroll_factor 0.5
      }

      # hide titlebar
      default_border none
      default_floating_border none
      font pango:monospace 0
      titlebar_padding 1
      titlebar_border_thickness 0

      # wallpaper
      output "*" bg ~/nixos-conf/home-manager/gui/sway/wallpapers/aesthetic_deer.jpg fill

      # gaps
      gaps inner 2px
      gaps outer 2px

      # tiling layout
      exec_always autotiling
    '';
  };
}
