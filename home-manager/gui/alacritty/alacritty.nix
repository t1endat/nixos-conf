let
  ROOT = builtins.toString ./.;
in {
  programs.alacritty = {
    enable = true;
    settings = {
      import = [ "${ROOT}/catppuccin-mocha.toml" ];
      # import = [ "./theme.yaml" ];
    };
  };
}
