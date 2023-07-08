{ config, lib, inputs, ... }:

with lib;

let
  cfg = config.modules.emacs;
in
{
  options.modules.emacs = {
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

      home.sessionPaths = [ "$XDG_CONFIG_HOME/doomemacs/bin" ];
    };

    system.userActivationScripts = {
      installDoomEmacs = ''
        if [ ! -d "$XDG_CONFIG_HOME/doomemacs" ]; then
          echo "=============== $XDG_CONFIG_HOME/doomemacs doesn't exist =================="
          ln -fs ${inputs.doomemacs} $XDG_CONFIG_HOME/doomemacs
        fi

        if [ ! -d "$HOME/.doom.d" ]; then
          echo "=============== $HOME/.doom.d doesn't exist =================="
          ln -fs ${../config/doom.d} $HOME/.doom.d
        fi
      '';
    };
  };
}
