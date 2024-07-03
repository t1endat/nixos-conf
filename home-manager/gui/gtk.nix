{ pkgs, ... }:
{
  gtk = {
    enable = true;
    # NOTE: it works!
    # source: https://stackoverflow.com/questions/38576616/how-to-install-gtk-themes-under-nixos-without-hacky-scripts
    theme = {
      name = "Materia-dark";
      package = pkgs.materia-theme;
    };
  };
}
