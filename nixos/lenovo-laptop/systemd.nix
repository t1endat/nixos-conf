{ pkgs, ... }:
let
  ROOT = builtins.toString ./.;
in
{
  # https://discourse.nixos.org/t/how-to-add-a-modprobe-reset-in-config/21423/5
  # reset devices list after reboot, run after init swayWM 
  systemd.services."reset-input-devices" = {
    #NOTE: it work!
    description = "Reset input devices to make keyboard work";
    after = [ "tlp.service" ];
    wantedBy = [ "tlp.service" ];
    serviceConfig = {
      Type = "oneshot";
    };
    path = with pkgs; [ bash ];
    script = ''
      bash ${ROOT}/reset-input-devices.sh
    '';
  };

  # turn off computer everyday
  # source: https://wiki.nixos.org/wiki/Systemd/timers
  systemd.timers."shutdown-daily" = {
    description = "daily shutdown timer";
    wantedBy = [ "timers.target" ];
    timerConfig = {
      # source: https://man.archlinux.org/man/systemd.time.7
      OnCalendar = "*-*-* 22,23,00,01,02,03,04,05:*:00";
      Persistent = true;
      Unit = "shutdown-daily.service";
    };
  };
  systemd.services."shutdown-daily" = {
    description = "force to shutdown daily";
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "/run/current-system/sw/bin/systemctl poweroff";
    };
  };

  # source: https://nixos.wiki/wiki/Sway#Systemd_services
  # kanshi systemd service
  systemd.user.services.kanshi = {
    description = "kanshi daemon for multiple monitor layout";
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.kanshi}/bin/kanshi -c ${ROOT}/kanshi_config";
    };
  };
}
