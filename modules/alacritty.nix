{ config, lib, ... }:

with lib;

let
  cfg = config.modules.alacritty;
in
{
  options.modules.alacritty = {
    enable = mkOption {
      type = types.bool;
      default = false;
    };
  };

  config = mkIf cfg.enable {
    modules.home-manager = {
      programs.alacritty.enable = true;

      xdg.configFile."alacritty/alacritty.yml".source = ../config/alacritty.yml;
    };
  }
