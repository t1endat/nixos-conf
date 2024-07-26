{ pkgs, minimalisticfox, ... }: 
let ROOT = builtins.toString ./.;
in{
  # # ffcsshacks
  # home.file.".mozilla/firefox/default/chrome/autohide_bookmarks_and_main_toolbars.css" = {
  #   source = "${ffcsshacks}/chrome/autohide_bookmarks_and_main_toolbars.css";
  # };

  home.file.".mozilla/firefox/default/chrome/minimalistic_tab.css" = {
    source = "${minimalisticfox}/minimalistic_tab.css";
  };

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
        userChrome = builtins.readFile "${ROOT}/userChrome.css";
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
        "browser.compactmode.show" = true;
        "browser.startup.homepage" = "https://duckduckgo.com";
      };

      # source: about:support
      ExtensionSettings = (import ./extensions.nix);
    };
  };
}
