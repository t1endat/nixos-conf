{ pkgs, ... }:
let
  platformio-udev = builtins.fetchurl {
    url =
      "https://raw.githubusercontent.com/platformio/platformio-core/develop/platformio/assets/system/99-platformio-udev.rules";
    sha256 = "1ihkih39vi48azf40z9qjy3m8whnpa21x7fjw2vrbwy15kzvp8yp";
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
