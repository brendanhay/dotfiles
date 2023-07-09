{ config, pkgs, lib, ... }:

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
          name = "orchis-theme";
          package = pkgs.orchis-theme;
        };
        iconTheme = {
          name = "Adwaita";
          package = pkgs.gnome.adwaita-icon-theme;
        };
        cursorTheme = {
          name = "Adwaita";
          package = pkgs.gnome.adwaita-icon-theme;
        };
      };
    };
  };
}
