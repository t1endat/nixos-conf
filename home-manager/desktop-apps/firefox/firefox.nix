{ pkgs, ... }: {
  # source: https://github.com/Jamir-boop/minimalisticfox 
  # home.file.".config/minimalisticfox-git" = {
  #   source = builtins.fetchGit {
  #     url = "https://github.com/Jamir-boop/minimalisticfox";
  #     rev = "a2c8e2d7bf6e5060bf4b77d9e8330f92fccf5376";
  #   };
  # };
  
  home.file.".config/minimalisticfox-git" = {
    source = builtins.fetchGit {
      url = "https://github.com/Jamir-boop/minimalisticfox";
      rev = "a2c8e2d7bf6e5060bf4b77d9e8330f92fccf5376";
    };
    recursive = true;
    # target = builtins.toString ./.;
  };
  
  # home.file.".mozilla/firefox/default/chrome/userChrome.css" = {
  #   # source = "/home/tiendat/.config/minimalisticfox-git/userChrome.css";
  #   source = "${HOME}/.config/minimalisticfox-git/userChrome.css";
  # }

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
}
