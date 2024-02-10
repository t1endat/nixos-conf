let
  #TODO: change to better code
  profile = "cpbibh9c.default";
in {
  # link file 
  home.file.".mozilla/firefox/${profile}/chrome" = {
    source = ./chrome;
    recursive = true;
  };

  # ublock to block short in yt : https://christitus.com/remove-youtube-shorts/
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
