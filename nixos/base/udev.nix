{ pkgs, ... }: {
  # source: https://discourse.nixos.org/t/how-to-create-files-in-the-etc-udev-rules-d-directory/11929/5
  services.udev.packages = [
    # (pkgs.writeTextFile {
    #   name = "platformio-udev";
    #   text = builtins.readFile ./99-platformio-udev.rules;
    #   destination = "/etc/udev/rules.d/99-platformio-udev.rules";
    # })
    pkgs.platformio-core
    pkgs.openocd
  ];
}
