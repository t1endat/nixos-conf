{ config, ... }:
let 
  profile = "cpbibh9c.default"
  symlink = config.lib.file.mkOutOfStoreSymlink;
in {
  # link file 
  home.file.".mozilla/firefox/${profile}/chrome/userChrome.css" = {
    source = symlink ./minimalisticfox/userChrome.css;
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
