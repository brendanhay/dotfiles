{ config, pkgs, lib, inputs, ... }:

with lib;

let
  cfg = config.modules.editors.emacs;
  emacsDir = "${config.modules.home-manager.xdg.configHome}/emacs";
  emacsRepoUrl = "https://github.com/doomemacs/doomemacs";
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

    fonts.fonts = [ pkgs.emacs-all-the-icons-fonts ];

    modules.home-manager = {
      programs.emacs.enable = true;

      services.emacs = {
        enable = true;
        client.enable = true;
      };

      home.sessionPath = [ "\${emacsDir}/bin" ];

      xdg.configFile."doom" = {
        source = ../config/doom;
        recursive = true;
      };
    };

    system.userActivationScripts.installDoomEmacs = ''
            if [ ! -d "${emacsDir}" ]; then
               ${pkgs.git}/bin/git clone --depth=1 --single-branch ${emacsRepoUrl} ${emacsDir}
      	 ${emacsDir}/bin/doom install --no-fonts
            fi
    '';
  };
}
