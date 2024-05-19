# source: https://github.com/gytis-ivaskevicius/nixfiles/blob/master/home-manager/keybindings.nix
let
  modifier = "Mod4";
  left = "h";
  down = "j";
  up = "k";
  right = "l";
  ROOT = builtins.toString ./.;
in {
  "${modifier}+Shift+1" = "move container to workspace number 1";
  "${modifier}+Shift+2" = "move container to workspace number 2";
  "${modifier}+Shift+3" = "move container to workspace number 3";
  "${modifier}+Shift+4" = "move container to workspace number 4";
  "${modifier}+Shift+5" = "move container to workspace number 5";
  "${modifier}+Shift+6" = "move container to workspace number 6";
  "${modifier}+Shift+7" = "move container to workspace number 7";
  "${modifier}+Shift+8" = "move container to workspace number 8";
  "${modifier}+Shift+9" = "move container to workspace number 9";

  "${modifier}+${left}" = "focus left";
  "${modifier}+${down}" = "focus down";
  "${modifier}+${up}" = "focus up";
  "${modifier}+${right}" = "focus right";

  "${modifier}+Shift+${left}" = "move left";
  "${modifier}+Shift+${down}" = "move down";
  "${modifier}+Shift+${up}" = "move up";
  "${modifier}+Shift+${right}" = "move right";

  "XF86MonBrightnessDown" = "exec light -U 5";
  "XF86MonBrightnessUp" = "exec light -A 5";
  "XF86AudioRaiseVolume" = "exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+";
  "XF86AudioLowerVolume" = "exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
  "XF86AudioMute" = "exec wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
  "XF86AudioPlay" = "exec playerctl play-pause";
  "XF86AudioNext" = "exec playerctl next";
  "XF86AudioPrev" = "exec playerctl prev";

  "${modifier}+Shift+Return" = "exec rofi -show drun";
  "${modifier}+Shift+q" = "exec wlogout";
  "${modifier}+Shift+e" =
    ''exec emacsclient --create-frame --alternate-editor=""'';
  "${modifier}+Ctrl+l" = ''
      exec swaylock \
    	--screenshots \
    	--clock \
    	--indicator \
    	--indicator-radius 100 \
    	--indicator-thickness 7 \
    	--effect-blur 7x5 \
    	--effect-vignette 0.5:0.5 \
    	--ring-color bb00cc \
    	--key-hl-color 880033 \
    	--line-color 00000000 \
    	--inside-color 00000088 \
    	--separator-color 00000000 \
    	--grace 2 \
    	--fade-in 0.2
  '';

  "${modifier}+q" = "kill";
  "${modifier}+f" = "fullscreen toggle";
  "${modifier}+b" = "exec firefox";
  "${modifier}+d" = "exec rofi -show run";
  "${modifier}+e" = "exec alacritty -e yazi";
  # "${modifier}+Ctrl+e" = "exec thunar"; # use more yazi
  "${modifier}+p" = "exec wlsunset -t 4000";
  "${modifier}+v" =
    "exec cliphist list | rofi -dmenu | cliphist decode | wl-copy";
  "${modifier}+Return" = "exec alacritty";
  "${modifier}+tab" = "workspace back_and_forth";
  "${modifier}+s" = "exec ${ROOT}/switch_workspaces.sh";
  "${modifier}+Print" = ''exec grim -g "$(slurp -d)" - | wl-copy -t image/png'';
}
