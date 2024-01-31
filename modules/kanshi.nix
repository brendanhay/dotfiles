{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.modules.kanshi;
in
{
  options.modules.kanshi = {
    enable = mkOption {
      type = types.bool;
      default = false;
    };
  };

  config = mkIf cfg.enable {
    modules.home-manager = {
      services.kanshi = {
        enable = true;
        profiles = {
          undocked = {
            outputs = [
              {
                criteria = "eDP-1";
              }
            ];
          };
          docked = {
            outputs = [
              {
                criteria = "eDP-1";
                #                position = "0,0";
              }

              {
                criteria = "DP-2";
                #                criteria = "GIGA-BYTE TECHNOLOGY CO., LTD. Gigabyte M32U 1010101";
                #                mode = "3840x2160";
                #                scale = 1.0;

                mode = "3840x2160";
                adaptiveSync = false;
                scale = 1.25;
                position = "1920,0";
              }

            ];
          };
        };
      };
    };
  };
}
