{ pkgs, ... }:
let
  tuigreet = "${pkgs.greetd.tuigreet}/bin/tuigreet";
  session = "${pkgs.sway}/bin/sway";
  # username = "tiendat";
in {
  # displayManager
  services.greetd = {
    enable = true;
    settings = {
      # initial_session = {
      #   command = "${session}";
      #   user = "${username}";
      # };
      default_session = {
        command =
          "${tuigreet} --greeting 'Welcome to NixOS!' --asterisks --remember --remember-user-session --time -cmd ${session}";
        user = "greeter";
      };
    };
  };
}
