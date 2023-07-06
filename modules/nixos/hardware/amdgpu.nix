{ options, config, lib, ... }:

let
  cfg = config.modules.hardware.amdgpu;
in
{
  options.modules.hardware.amdgpu = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };

  config = lib.mkIf cfg.enable {
    hardware.opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
    };

    boot.kernelModules = [ "amdgpu" ];

    services.xserver = {
      videoDrivers = [ "amdgpu" ];
      deviceSection = ''
        Option "TearFree" "true"
      '';
    };
  };
}
