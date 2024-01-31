{ config, lib, ... }:

with lib;

let
  cfg = config.modules.wezterm;
in
{
  options.modules.wezterm = {
    enable = mkOption {
      type = types.bool;
      default = false;
    };
  };

  config = mkIf cfg.enable {
    modules.sway.terminal = "wezterm";
    modules.home-manager = {
      programs.wezterm.enable = true;

      xdg.configFile."wezterm/wezterm.lua".source = ../config/wezterm.lua;
    };
  };
}
