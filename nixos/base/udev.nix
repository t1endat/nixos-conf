{ pkgs, ... }:
let
  platformio-udev = builtins.fetchurl {
    url =
      "https://raw.githubusercontent.com/platformio/platformio-core/develop/platformio/assets/system/99-platformio-udev.rules";
    sha256 = "07xbwvnzm3zr695j9rlpxa09vln3ra72k9298pgdb8261viarwq9";
  };
in {
  # source: https://discourse.nixos.org/t/how-to-create-files-in-the-etc-udev-rules-d-directory/11929/5
  services.udev.packages = with pkgs; [
    (pkgs.writeTextFile {
      name = "platformio-udev";
      # text = builtins.readFile ./99-platformio-udev.rules;
      text = builtins.readFile platformio-udev;
      destination = "/etc/udev/rules.d/99-platformio-udev.rules";
    })
    platformio-core.udev
    openocd
  ];

}
