{ pkgs, ... }: {
  # source: https://github.com/Jamir-boop/minimalisticfox 
  home.file.".mozilla/firefox/default/chrome" = {
    source = ./chrome;
    recursive = true;
  };

  # Source: https://discourse.nixos.org/t/declare-firefox-extensions-and-settings/36265
  programs.firefox = {
    enable = true;
    package = (pkgs.wrapFirefox
      (pkgs.firefox-unwrapped.override { pipewireSupport = true; }) { });
    profiles = {
      default = {
        id = 0;
        name = "default";
        path = "default";
      };
    };
    # source: about:policies#documentation
    policies = {
      AppAutoUpdate = true;
      DisableAppUpdate = false;
      DisplayBookmarksToolbar = "never";
      DisablePrivateBrowsing = true;
      DisplayMenuBar = "default-off";
      SearchBar = "unified";
      Preferences = {
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "browser.ctrlTab.sortByRecentlyUsed" = true;
        "browser.display.use_document_fonts" = 0;
        "browser.fullscreen.autohide" = false;
        "browser.startup.page" = 3;
        "font.name.monospace.x-western" = "Symbols Nerd Font";
      };

      # source: about:support
      ExtensionSettings = (import ./extensions.nix);
    };
  };

  # source: https://nixos.wiki/wiki/Firefox#Screen_Sharing_under_Wayland
  # Set environment variables to hint Firefox to use Wayland features
  home.sessionVariables = {
    # only needed for Sway
    XDG_CURRENT_DESKTOP = "sway";
  };
}
