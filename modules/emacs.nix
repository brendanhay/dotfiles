{ inputs, ... }:

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

  config = {
    nixpkgs.overlays = [ (import inputs.emacs-overlay) ];

    services.emacs = {
      enable = true;
      defaultEditor = false;
      client.enable = true;
    };

    modules.home-manager.programs.emacs = {
      enable = true;
    };

    ./mime.nix
    };
    }
