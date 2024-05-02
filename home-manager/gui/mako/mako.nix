let
  ROOT = builtins.toString ./.;
  extra = builtins.readFile ./extraConfig;
  mocha = builtins.readFile ./catppuccin-mako/src/mocha;
in {
  home.file.".config/catppuccin-mako-git" = {
    source = builtins.fetchGit {
      url = "https://github.com/catppuccin/mako";
      rev = "9dd088aa5f4529a3dd4d9760415e340664cb86df";
    };
    # target = ./.;
    target = builtins.toString ./.;
  };
  
  services.mako = {
    enable = true;
    extraConfig = ''
      ${extra}
      ${mocha}
    '';
    
      # ${mocha}
  };
}
