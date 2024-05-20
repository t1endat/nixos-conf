# source: https://github.com/gytis-ivaskevicius/nixfiles/blob/master/home-manager/keybindings.nix
{ pkgs, ... }:
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

  "XF86MonBrightnessDown" = "exec ${pkgs.light}/bin/light -U 5";
  "XF86MonBrightnessUp" = "exec ${pkgs.light}/bin/light -A 5";
  "XF86AudioRaiseVolume" = "exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+";
  "XF86AudioLowerVolume" = "exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
  "XF86AudioMute" = "exec wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
  "XF86AudioPlay" = "exec ${pkgs.playerctl}/bin/playerctl play-pause";
  "XF86AudioNext" = "exec ${pkgs.playerctl}/bin/playerctl next";
  "XF86AudioPrev" = "exec ${pkgs.playerctl}/bin/playerctl prev";

  "${modifier}+Shift+Return" = "exec ${pkgs.rofi}/bin/rofi -show drun";
  "${modifier}+Shift+q" = "exec ${pkgs.wlogout}/bin/wlogout";
  "${modifier}+Shift+e" =
    ''exec ${pkgs.emacs29-gtk3}/bin/emacsclient --create-frame --alternate-editor=""'';
  "${modifier}+Ctrl+l" = ''
      exec ${pkgs.swaylock-effects}/bin/swaylock \
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
  "${modifier}+d" = "exec ${pkgs.rofi}/bin/rofi -show run";
  # "${modifier}+e" = "exec ${pkgs.alacritty}/bin/alacritty -e ${yazi.packages.${pkgs.system}.default}/bin/yazi";
  "${modifier}+e" = "exec ${pkgs.alacritty}/bin/alacritty -e ${pkgs.yazi}/bin/yazi";
  # "${modifier}+Ctrl+e" = "exec thunar"; # use more yazi
  "${modifier}+p" = "exec ${pkgs.wlsunset}/bin/wlsunset -t 4000";
  "${modifier}+v" =
    "exec ${pkgs.cliphist}/bin/cliphist list | ${pkgs.rofi}/bin/rofi -dmenu | ${pkgs.cliphist}/bin/cliphist decode | ${pkgs.wl-clipboard}/bin/wl-copy";
  "${modifier}+Return" = "exec ${pkgs.alacritty}/bin/alacritty";
  "${modifier}+tab" = "workspace back_and_forth";
  "${modifier}+s" = "exec ${ROOT}/switch_workspaces.sh";
  "${modifier}+Print" = ''exec ${pkgs.grim}/bin/grim -g "$(${pkgs.slurp}/bin/slurp -d)" - | ${pkgs.wl-clipboard}/bin/wl-copy -t image/png'';
  "${modifier}+Shift+Print" = ''exec ${pkgs.grim}/bin/grim -o $(${pkgs.sway}/bin/swaymsg -t get_outputs | ${pkgs.jq}/bin/jq -r '.[] | select(.focused) | .name')'';
}
