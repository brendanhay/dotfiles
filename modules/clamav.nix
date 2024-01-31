{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.modules.clamav;
in
{
  options.modules.clamav = {
    enable = mkOption {
      type = types.bool;
      default = false;
    };
  };

  config = mkIf cfg.enable {
    services.clamav = {
      daemon.enable = true;
      updater.enable = true;
    };

    systemd.services.clamav-daemon.serviceConfig = {
      StateDirectory = "clamav";
    };
  };
}
