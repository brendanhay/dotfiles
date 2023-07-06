{ options, config, lib, pkgs, ... }:

let
  cfg = config.modules.hardware.audio;
in
{
  options.modules.hardware.audio = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };

  config = lib.mkIf cfg.enable {
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };

    security.rtkit.enable = true;

    user.extraGroups = [ "audio" ];
  };
}
