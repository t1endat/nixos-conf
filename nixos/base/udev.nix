{ pkgs, ... }: {
  services.udev.packages = [
    pkgs.writeTextFile
    {
      name = "platformio-udev";
      text = ''
        ...
      '';
      destination = "/etc/udev/rules.d/99-platformio-udev.rules";
    }
  ];
}
