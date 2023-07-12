{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.modules.river;
in
{
  options.modules.river = {
    enable = mkOption {
      type = types.bool;
      default = false;
    };
  };

  config = mkIf cfg.enable {
    services.dbus.enable = true;

    environment.systemPackages = with pkgs; [
      playerctl
      pulseaudio # pactl
      alacritty
      river
      brightnessctl
    ];

    modules.home-manager.xdg.configFile."river/init" = {
      source = ../config/river/init;
    };
  };
}
