{ pkgs, ... }:
let
ROOT = builtins.toString ./.;
settings_toml = (builtins.readFile "${ROOT}/config.toml");
languages_toml = (builtins.readFile "${ROOT}/languages.toml");
in {
  programs.helix = {
    enable = true;
    defaultEditor = true;
    settings = (builtins.fromTOML settings_toml);
    languages = (builtins.fromTOML languages_toml);
  };

  home.packages = with pkgs; [
    unstable.vale
    unstable.vale-ls
  ];

  # spell checking
  home.file.".config/vale/.vale.ini" = {
    source = "${ROOT}/vale.ini";
  };
}
