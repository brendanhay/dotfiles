{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.modules.rofi;
in
{
  options.modules.rofi = {
    enable = mkOption {
      type = types.bool;
      default = false;
    };
  };

  # XXX: paper-icon-theme

  config = mkIf cfg.enable {
    modules.home-manager = {
      xdg.configFile."rofi" = {
        source = ../config/rofi
          recursive = true;
      };

      programs.rofi = {
        enable = true;
        package = [ pkgs.rofi-wayland-unwrapped ];
        configPath = "$XDG_CONFIG_HOME/rofi/config.generated.rasi";
        extraConfig = ../config/rofi/config.rasi;
      };
    };
  };
}
