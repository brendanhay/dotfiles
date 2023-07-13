{ config, lib, ... }:

with lib;

let
  cfg = config.modules.dropbox;
in
{
  options.modules.dropbox = {
    enable = mkOption {
      type = types.bool;
      default = false;
    };
  };

  config = mkIf cfg.enable {
    modules.home-manager = {
      services.dropbox.enable = true;
    };
  };
}
