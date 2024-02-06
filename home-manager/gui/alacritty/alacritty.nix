let
  ROOT = builtins.toString ./.;
in {
  programs.alacritty = {
    enable = true;
    settings = {
      # import = [ "~/nix/nixos-conf/home-manager/gui/alacritty/theme.yaml" ];
      import = [ "${ROOT}/theme.yaml" ];
    };
  };
}
