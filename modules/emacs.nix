{ config, lib, inputs, ... }:

with lib;

let
  cfg = config.modules.editors.emacs;
  doomemacsDir = "${config.modules.home-manager.xdg.dataHome}/doomemacs";
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

      home.sessionPath = [ "\${doomemacsDir}/bin" ];

      home.file.".doom.d" = {
        source = ../config/doom.d;
        recursive = true;
      };
    };

    system.userActivationScripts.installDoomEmacs = ''
      if [ ! -d "${doomemacsDir}" ]; then
         cp -R ${inputs.doomemacs} "${doomemacsDir}"
      fi
    '';
  };
}
