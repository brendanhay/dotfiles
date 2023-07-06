{
  config,
  options,
  pkgs,
  lib,
  ...
}:
with lib; let
  cfg = config.modules.hardware.fs;
in {
  options.modules.hardware.fs = with types; {
    enable = mkOption {
      type = bool;
      default = false;
    };
    zfs.enable = mkOption {
      type = bool;
      default = false;
    };
    ssd.enable = mkOption {
      type = bool;
      default = false;
    };
  };

  config = mkIf cfg.enable (mkMerge [
    {
      programs.udevil.enable = true;

      # Support for more filesystems, mostly to support external drives
      environment.systemPackages = with pkgs; [
        sshfs
        exfat # Windows drives
        ntfs3g # Windows drives
        hfsprogs # MacOS drives
      ];
    }

    (mkIf (!cfg.zfs.enable && cfg.ssd.enable) {
      services.fstrim.enable = true;
    })

    (mkIf cfg.zfs.enable (mkMerge [
      {
        boot = {
          loader.grub = {
            copyKernels = true;
            zfsSupport = true;
          };

          supportedFilesystems = ["zfs"];

          zfs = {
            devNodes = "/dev/disk/by-id";
            forceImportRoot = false;
          };
        };

        services.zfs.autoScrub.enable = true;
      }

      (mkIf cfg.ssd.enable {
        # Will only TRIM SSDs; skips over HDDs
        services.fstrim.enable = false;
        services.zfs.trim.enable = true;
      })
    ]))
  ]);
}
