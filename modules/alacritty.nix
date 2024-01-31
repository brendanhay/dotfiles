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
    modules.sway.terminal = "alacritty";
    modules.home-manager = {
      programs.alacritty.enable = true;

      xdg.configFile."alacritty/alacritty.toml".source = ../config/alacritty.toml;
    };
  };
}
