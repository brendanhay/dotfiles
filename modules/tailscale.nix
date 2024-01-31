{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.modules.tailscale;
in
{
  options.modules.tailscale = {
    enable = mkOption {
      type = types.bool;
      default = false;
    };
  };

  config = mkIf cfg.enable {
    services.tailscale.enable = true;
  };
}
