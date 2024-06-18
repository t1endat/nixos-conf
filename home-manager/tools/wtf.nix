{ pkgs, ... }: {
  home.packages = with pkgs; [
    wtf # personal dashboard

    upower # power management
   ];
}
