{
  # source: https://nixos.wiki/wiki/Docker
  virtualisation.docker = {
    enable = true;
    # can not work with cvat
    # rootless = {
    #   enable = true;
    #   setSocketVariable = true;
    # };
  };
}
