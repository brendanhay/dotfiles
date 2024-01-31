{ config, pkgs, lib, inputs, ... }:

with lib;

let
  cfg = config.modules.editors.emacs;
  emacsDir = "${config.modules.home-manager.xdg.configHome}/emacs";
  emacsRepoUrl = "https://github.com/doomemacs/doomemacs";
  package = pkgs.emacs;
in
{
  options.modules.editors.emacs = {
    enable = mkOption {
      type = types.bool;
      default = false;
    };
  };

  config = mkIf cfg.enable {
    nixpkgs.overlays = [ inputs.emacs-overlay.overlays.default ];

    fonts.packages = [ pkgs.emacs-all-the-icons-fonts ];

    modules.home-manager = {
      programs.emacs = {
        inherit package;
        enable = true;
      };

      services.emacs = {
        inherit package;
        enable = true;
        client.enable = true;
      };

      home.sessionPath = [ "\${emacsDir}/bin" ];

      home.shellAliases = {
        "e" = "emacsclient -n";
      };

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
