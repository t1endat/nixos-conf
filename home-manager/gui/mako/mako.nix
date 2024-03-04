let
  mocha = builtins.readFile ./mocha;
  extra = builtins.readFile ./extraConfig;
in {
  services.mako = {
    enable = true;
    extraConfig = ''
      ${extra}
      ${mocha}
    '';
  };
}
