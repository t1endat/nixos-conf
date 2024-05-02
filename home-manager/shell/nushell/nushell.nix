let
  theme = builtins.readFile ./theme.nu;
  extraConfig = builtins.readFile ./configExtra.nu; 
in {
  programs.nushell = {
    enable = true;
    configFile.source = ./config.nu;
    envFile.source = ./env.nu;
    # extraConfig = builtins.readFile ./configExtra.nu;
    extraConfig = 
    ''
    ${theme}
    ${extraConfig}
    '';
    extraEnv = builtins.readFile ./envExtra.nu;
  };
}

