{ pkgs, minimalisticfox, ... }: {
  # Source: https://discourse.nixos.org/t/declare-firefox-extensions-and-settings/36265
  programs.firefox = {
    enable = true;
    package = (pkgs.wrapFirefox
      (pkgs.firefox-unwrapped.override { pipewireSupport = true; }) { });
    profiles = {
      default = {
        id = 0;
        path = "default";
        # source: https://github.com/Jamir-boop/minimalisticfox 
        userChrome = builtins.readFile "${minimalisticfox}/userChrome.css";
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
        "font.name.monospace.x-western" = "IntoneMono Nerd Font Propo";
      };

      # source: about:support
      ExtensionSettings = (import ./extensions.nix);
    };
  };
}
