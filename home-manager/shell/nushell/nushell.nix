{
  programs.nushell = {
    enable = true;
    configFile.source = ./config.nu;
    envFile.source = ./env.nu;
    extraConfig = builtins.readFile ./configExtra.nu;
    extraEnv = builtins.readFile ./envExtra.nu;
  };
}

