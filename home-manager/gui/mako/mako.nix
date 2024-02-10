let 
  ROOT = builtins.toString ./.;
  mocha = import ./mocha;
in {
  services.mako = {
    enable = true;
    extraConfig = mocha;
  };
}
