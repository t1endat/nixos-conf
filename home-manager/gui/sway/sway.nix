let
  ROOT = builtins.toString ./.;
  mod = "Mod4";
in {
  wayland.windowManager.sway = {
    enable = true;
    config = rec {
      input = {
        "type:touchpad" = {
          tap = "enable";
          natural_scroll = "enable";
          scroll_factor = "0.5";
        };

        "type:pointer".accel_profile = "flat";
      };
      output = {
        "*".bg = "${ROOT}/wallpapers/aesthetic_deer.jpg fill";
      };
      modifier = "${mod}";
      terminal = "alacritty";
      bars = [{ command = "waybar"; }];
      gaps = {
        inner = 2;
        outer = 2;
      };
      keybindings = (import ./keybindings.nix);
    };
    extraConfig = ''
      # flags for keybindings
      bindsym --no-repeat ${mod}+1 workspace number 1; exec "echo 1 > /tmp/sovpipe"
      bindsym --no-repeat ${mod}+2 workspace number 2; exec "echo 1 > /tmp/sovpipe"
      bindsym --no-repeat ${mod}+3 workspace number 3; exec "echo 1 > /tmp/sovpipe"
      bindsym --no-repeat ${mod}+4 workspace number 4; exec "echo 1 > /tmp/sovpipe"
      bindsym --no-repeat ${mod}+5 workspace number 5; exec "echo 1 > /tmp/sovpipe"
      bindsym --no-repeat ${mod}+6 workspace number 6; exec "echo 1 > /tmp/sovpipe"
      bindsym --no-repeat ${mod}+7 workspace number 7; exec "echo 1 > /tmp/sovpipe"
      bindsym --no-repeat ${mod}+8 workspace number 8; exec "echo 1 > /tmp/sovpipe"
      bindsym --no-repeat ${mod}+9 workspace number 9; exec "echo 1 > /tmp/sovpipe"
      bindsym --no-repeat ${mod}+0 workspace number 10; exec "echo 1 > /tmp/sovpipe"

      bindsym --release ${mod}+1 exec "echo 0 > /tmp/sovpipe"
      bindsym --release ${mod}+2 exec "echo 0 > /tmp/sovpipe"
      bindsym --release ${mod}+3 exec "echo 0 > /tmp/sovpipe"
      bindsym --release ${mod}+4 exec "echo 0 > /tmp/sovpipe"
      bindsym --release ${mod}+5 exec "echo 0 > /tmp/sovpipe"
      bindsym --release ${mod}+6 exec "echo 0 > /tmp/sovpipe"
      bindsym --release ${mod}+7 exec "echo 0 > /tmp/sovpipe"
      bindsym --release ${mod}+8 exec "echo 0 > /tmp/sovpipe"
      bindsym --release ${mod}+9 exec "echo 0 > /tmp/sovpipe"
      bindsym --release ${mod}+0 exec "echo 0 > /tmp/sovpipe"

      # hide titlebar
      default_border none
      default_floating_border none
      font pango:monospace 0
      titlebar_padding 1
      titlebar_border_thickness 0
      
      # daemon
      exec_always autotiling # tiling layout
      exec mako --default-timeout 5000 # notification daemon
      exec wl-paste --watch cliphist store # cliphist daemon
      exec wlsunset -l 21.0 -L 105.8 # Hanoi lat/long for wlsunset
      exec rm -f /tmp/sovpipe && mkfifo /tmp/sovpipe && tail -f /tmp/sovpipe | sov -t 500 # sov with swaywm
    '';
  };
}
