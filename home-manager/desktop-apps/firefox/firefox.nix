{ config, ... }:
let 
  profile = "cpbibh9c.default";
  symlink = config.lib.file.mkOutOfStoreSymlink;
in {
  # link file 
  home.file.".mozilla/firefox/${profile}/chrome" = {
    source = ./chrome;
    recursive = true;
  };
  
  # Source: https://discourse.nixos.org/t/declare-firefox-extensions-and-settings/36265
  programs.firefox = {
    enable = true;
    policies = {
      DisablePrivateBrowsing = true;
      Preferences = {
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
      };
    };
  };
}
