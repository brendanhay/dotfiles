{ config, lib, ... }:

with lib;

let
  cfg = config.modules.direnv;
in
{
  options.modules.direnv = {
    enable = mkOption {
      type = types.bool;
      default = false;
    };
  };

  config = mkif cfg.enable {
    modules.home-manager.direnv = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}
