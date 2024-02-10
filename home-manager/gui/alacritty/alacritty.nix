let ROOT = builtins.toString ./.;
in {
  programs.alacritty = {
    enable = true;
    settings = { import = [ "${ROOT}/theme.yaml" ]; };
  };
}
