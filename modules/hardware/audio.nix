{ options, config, pkgs, lib, ... }:

with lib;

let
  cfg = config.modules.hardware.audio;
in
{
  options.modules.hardware.audio = {
    enable = mkOption {
      type = types.bool;
      default = false;
    };
  };

  config = mkIf cfg.enable {
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };

    security.rtkit.enable = true;

    modules.user.extraGroups = [ "audio" ];
  };
}
