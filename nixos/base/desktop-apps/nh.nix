{
  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
    flake = "/home/tiendat/Documents/nix-dev/nixos-conf";
  };
}
