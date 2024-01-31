{ config, pkgs, lib, ... }:

with lib;

let
  cfg = config.modules.gpg;
in
{
  options.modules.gpg = {
    enable = mkOption {
      type = types.bool;
      default = false;
    };
  };

  config = mkIf cfg.enable {
    modules.home-manager = {
      programs.gpg = {
        enable = true;
      };

      services.gpg-agent = {
        enable = true;
        pinentryPackage = pkgs.pinentry-gnome3;
        defaultCacheTtl = 3600;
      };
    };
  };
}
