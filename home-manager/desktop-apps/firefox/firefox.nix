{ pkgs, ... }:
let
  #TODO: change to better code
  profile = "cpbibh9c.default";
in {
  # source: https://github.com/Jamir-boop/minimalisticfox 
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
      };
      
      # source: about:support
      ExtensionSettings = {
        # Catppuccin-mocha-blue
        "{88b098c8-19be-421e-8ffa-85ddd1f3f004}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/catppuccin-mocha-blue/latest.xpi";
          installation_mode = "force_installed";
        };
        # Dark reader
        "addon@darkreader.org" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/darkreader/latest.xpi";
          installation_mode = "force_installed";
        };
        # Disconnect
        "2.0@disconnect.me" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/disconnect/latest.xpi";
          installation_mode = "force_installed";
        };
        # QuicKey – The quick tab switcher
        "{0b289d05-9030-47a6-813b-aa80bbf959f5}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/quickey-the-quick-tab-switcher/latest.xpi";
          installation_mode = "force_installed";
        };
        # Rust Search Extension
        "{04188724-64d3-497b-a4fd-7caffe6eab29}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/rust-search-extension/latest.xpi";
          installation_mode = "force_installed";
        };
        # Refined GitHub
        "{a4c4eda4-fb84-4a84-b4a1-f7c1cbf2a1ad}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/refined-github-/latest.xpi";
          installation_mode = "force_installed";
        };
        # Zhongwen: The Popular Chinese Learning Tool
        "{dedb3663-6f13-4c6c-bf0f-5bd111cb2c79}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/zhongwen/latest.xpi";
          installation_mode = "force_installed";
        };
        # C/C++ Search Extension
        "{e737d9cb-82de-4f23-83c6-76f70a82229c}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/c-c-search-extension/latest.xpi";
          installation_mode = "force_installed";
        };
        # FastForward
        "addon@fastforward.team" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/fastforwardteam/latest.xpi";
          installation_mode = "force_installed";
        };
        # Browsec VPN - Free VPN for Firefox
        "browsec@browsec.com" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/browsec/latest.xpi";
          installation_mode = "force_installed";
        };
        # Ghostery Tracker Ad Blocker - Privacy AdBlock
        "firefox@ghostery.com" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ghostery/latest.xpi";
          installation_mode = "force_installed";
        };
        # Privacy Badger
        "jid1-MnnxcxisBPnSXQ@jetpack" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/privacy-badger17/latest.xpi";
          installation_mode = "force_installed";
        };
        # DuckDuckGo
        "jid1-ZAdIEUB7XOzOJw@jetpack" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/duckduckgo-for-firefox/latest.xpi";
          installation_mode = "force_installed";
        };
        # Firefox Relay
        "private-relay@firefox.com" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/private-relay/latest.xpi";
          installation_mode = "force_installed";
        };
        # Simple Tab Groups
        "simple-tab-groups@drive4ik" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/simple-tab-groups/latest.xpi";
          installation_mode = "force_installed";
        };
        # uBlock Origin
        "uBlock0@raymondhill.net" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          installation_mode = "force_installed";
        };
        # Bitwarden - Free Password Manager
        "{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/bitwarden-password-manager/latest.xpi";
          installation_mode = "force_installed";
        };
        # Auto Tab Discard
        "{c2c003ee-bd69-42a2-b0e9-6f34222cb046}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/auto-tab-discard/latest.xpi";
          installation_mode = "force_installed";
        };
        # Vimium
        "{d7742d87-e61d-4b78-b8a1-b469842139fa}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/vimium-ff/latest.xpi";
          installation_mode = "force_installed";
        };
        # NixOS Packages Search Engine
        "{eceab40b-230a-4560-98ed-185ad010633f}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/nixos-packages-search-engine/latest.xpi";
          installation_mode = "force_installed";
        };
      };
    };
  };

  # source: https://nixos.wiki/wiki/Firefox#Screen_Sharing_under_Wayland
  # Set environment variables to hint Firefox to use Wayland features
  home.sessionVariables = {
    # only needed for Sway
    XDG_CURRENT_DESKTOP = "sway";
  };
}
