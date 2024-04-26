{ pkgs, ... }: {
  home.packages = with pkgs; [
    gnome.gnome-control-center
    gnome.gnome-calendar
  ];
}
