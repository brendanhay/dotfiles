{ config, pkgs, lib, ... }:

with lib;

let
  cfg = config.modules.gtk;
in
{
  options.modules.gtk = {
    enable = mkOption {
      type = types.bool;
      default = false;
    };
  };

  config = mkIf cfg.enable {
    modules.home-manager = {
      dconf = {
        settings = {
          "org/gnome/desktop/interface" = {
            color-scheme = "prefer-dark";
          };
        };
      };

      gtk = {
        enable = true;

        theme = {
          name = "Paper";
          package = pkgs.paper-gtk-theme;
        };

        iconTheme = {
          name = "Paper";
          package = pkgs.paper-icon-theme;
        };

        #        cursorTheme = {
        #          name = "Paper";
        #          package = pkgs.paper-icon-theme;
        #        };
      };
    };
  };
}
