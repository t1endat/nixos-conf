let readFile = builtins.readFile;
in {
  services.mako = {
    enable = true;
    # extraConfig = readFile ./mocha;
    extraConfig = readFile ./test;
  };
}
