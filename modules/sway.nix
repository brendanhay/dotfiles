{ config, pkgs, lib, ... }:

let
  cfg = config.modules.sway;
in
{
  options.modules.sway = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };

  config = lib.mkIf cfg.enable {
    environment = {
      pathstoLink = [ "/libexec" ];
      systemPackages = with pkgs; [
        lightdm
      ];
    };
  };
}:wq
:
