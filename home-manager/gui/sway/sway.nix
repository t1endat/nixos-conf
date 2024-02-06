let
  ROOT = builtins.toString ./.;
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
      modifier = "Mod4";
      terminal = "alacritty";
      bars = [{ command = "waybar"; }];
      gaps = {
        inner = 2;
        outer = 2;
      };
      keybindings = (import ./keybindings.nix);
    };
    extraConfig = ''
      # hide titlebar
      default_border none
      default_floating_border none
      font pango:monospace 0
      titlebar_padding 1
      titlebar_border_thickness 0

      # tiling layout
      exec_always autotiling

      # notification daemon
      exec mako
    '';
  };
}
