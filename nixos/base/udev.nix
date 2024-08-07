{ pkgs, platformio-udev,... }:
{
  # source: https://discourse.nixos.org/t/how-to-create-files-in-the-etc-udev-rules-d-directory/11929/5
  services.udev.packages = with pkgs; [
    (pkgs.writeTextFile {
      name = "platformio-udev";
      text = platformio-udev;
      destination = "/etc/udev/rules.d/99-platformio-udev.rules";
    })
    platformio-core.udev
    openocd
  ];

}
