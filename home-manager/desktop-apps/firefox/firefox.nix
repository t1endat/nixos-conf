{ pkgs, ... }:
let
  #TODO: change to better code
  profile = "cpbibh9c.default";
in {
  # better style 
  home.file.".mozilla/firefox/${profile}/chrome" = {
    source = ./chrome;
    recursive = true;
  };

  # ublock to block short in yt : https://christitus.com/remove-youtube-shorts/
  # Source: https://discourse.nixos.org/t/declare-firefox-extensions-and-settings/36265
  programs.firefox = {
    enable = true;
    package = (pkgs.wrapFirefox
      (pkgs.firefox-unwrapped.override { pipewireSupport = true; }) { });
    policies = {
      DisablePrivateBrowsing = true;
      Preferences = {
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
      };
    };
  };

  # Set environment variables to hint Firefox to use Wayland features
  home.sessionVariables = {
    # only needed for Sway
    XDG_CURRENT_DESKTOP = "sway";
  };
}
