{ config, pkgs, lib, ... }:

with lib;

let
  cfg = config.modules.firefox;
in
{
  options.modules.firefox = {
    enable = mkOption {
      type = types.bool;
      default = false;
    };
  };

  config = mkIf cfg.enable {
    modules.home-manager.programs.firefox = {
      enable = true;
      profiles.${config.modules.user.name} = {
        extensions = with pkgs.nur.repos.rycee.firefox-addons; [
          bitwarden
          clearurls
          libredirect
          no-pdf-download
          privacy-badger
          translate-web-pages
          ublock-origin
        ];

        settings = {
          "gfx.webrender.all" = true;
        };
      };
    };
  };
}
