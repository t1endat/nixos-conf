let 
  readFile = builtins.readFile;
in {
  # TODO: prevent copy manual
  services.mako = {
    enable = true;
    extraConfig = readFile ./mocha;
  };
}
