{ config, pkgs, lib, ... }:

with lib;

let
  cfg = config.modules.swaylock;
in
{
  options.modules.swaylock = {
    enable = mkOption {
      type = types.bool;
      default = false;
    };
  };

  config = mkIf cfg.enable {
    modules.home-manager = {
      programs.swaylock = {
        enable = true;
        settings = {
          daemonize = true;
          ignore-empty-password = true;
        };
      };

      services.swayidle = {
        enable = true;
        timeouts = [
          {
            timeout = 595;
            command = "${pkgs.libnotify}/bin/notify-send 'Locking in 5 seconds' -t 5000";
          }
          {
            timeout = 600;
            command = "${pkgs.swaylock}/bin/swaylock -c 000000";
          }
          {
            timeout = 660;
            command = "${pkgs.sway}/bin/swaymsg 'output * dpms off'";
            resumeCommand = "${pkgs.sway}/bin/swaymsg 'output * dpms on'";
          }
        ];
        events = [
          {
            event = "before-sleep";
            command = "${pkgs.swaylock}/bin/swaylock -c 000000";
          }
        ];
      };
    };
  };
}
