{
  options,
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.modules.hardware.amdgpu;
in {
  options.modules.hardware.amdgpu = {
    enable = mkOption {
      type = types.bool;
      default = false;
    };
  };

  config = mkIf cfg.enable {
    hardware.opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
    };

    boot.initrd.kernelModules = ["amdgpu"];

    services.xserver = {
      videoDrivers = ["amdgpu"];
      deviceSection = ''
        Option "TearFree" "true"
      '';
    };
  };
}
