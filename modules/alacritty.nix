{ config, ... }:

with lib;

let
  cfg = config.modules.alacritty;
in
{
  options.modules.alacritty = {
    enable = mkOption {
      type = types.bool;
      default = false;
    };
  };

  config = {
    home-manager.programs.alacritty.enable = true;
  };
}
