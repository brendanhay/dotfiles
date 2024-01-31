{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.modules.steam;
in
{
  options.modules.steam = {
    enable = mkOption {
      type = types.bool;
      default = false;
    };
  };

  config = mkIf cfg.enable {
    modules.home-manager.home.packages = with pkgs; [
      steam
      lutris

      # support both 32- and 64-bit applications
      # wineWowPackages.stable

      # support 32-bit only
      # wine

      # support 64-bit only
      # (wine.override { wineBuild = "wine64"; })

      # wine-staging (version with experimental features)
      # wineWowPackages.staging

      # winetricks (all versions)
      # winetricks

      # native wayland support (unstable)
      wineWowPackages.waylandFull
      winetricks
    ];
  };
}
