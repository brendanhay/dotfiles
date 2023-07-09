{ config, lib, inputs, ... }:

with lib;

let
  cfg = config.modules.editors.emacs;
in
{
  options.modules.editors.emacs = {
    enable = mkOption {
      type = types.bool;
      default = false;
    };
  };

  config = mkIf cfg.enable {
    nixpkgs.overlays = [ (import inputs.emacs-overlay) ];

    modules.home-manager = {
      programs.emacs.enable = true;

      services.emacs = {
        enable = true;
        client.enable = true;
      };

      home.sessionPath = [ "$XDG_DATA_HOME/doomemacs/bin" ];

      home.file.".doom.d" = {
        source = ../config/doom.d;
        recursive = true;
      };

      xdg.dataFile."doomemacs" = {
        source = inputs.doomemacs;
        recursive = true;
      };
    };
  };
}
