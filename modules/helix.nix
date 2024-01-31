{ config, options, pkgs, lib, inputs, ... }:

with lib;
let
  cfg = config.modules.editors.helix;
in
{
  options.modules.editors.helix = {
    enable = mkOption {
      type = types.bool;
      default = false;
    };
  };

  config = mkIf cfg.enable {
    nixpkgs.overlays = [ inputs.helix.overlays.default ];

    environment.systemPackages = with pkgs; [ helix ];

    modules.home-manager = {
      programs.helix = {
        enable = true;
        defaultEditor = false;
      };
    };
  };
}
