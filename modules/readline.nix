{ config, lib, ... }:

with lib;

let
  cfg = config.modules.readline;
in
{
  options.modules.readline = {
    enable = mkOption {
      type = types.bool;
      default = false;
    };
  };

  config = mkIf cfg.enable {
    modules.home-manager.programs.readline = {
      enable = true;
      extraConfig = ''
        set editing-mode vi
      '';
    };
  };
}
