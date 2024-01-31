{ config, options, pkgs, lib, ... }:

with lib;

let
  cfg = config.modules.hardware.filesystem;
in
{
  options.modules.hardware.filesystem = {
    enable = mkOption {
      type = types.bool;
      default = false;
    };

    zfs.enable = mkOption {
      type = types.bool;
      default = false;
    };

    ssd.enable = mkOption {
      type = types.bool;
      default = false;
    };
  };

  config = mkIf cfg.enable (mkMerge [
    {
      # udisk replacement for automounts.
      programs.udevil.enable = true;

      environment.systemPackages = with pkgs; [
        sshfs
        exfat # Windows drives.
        ntfs3g # Windows drives.
        hfsprogs # MacOS drives.
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

          supportedFilesystems = [ "zfs" ];

          zfs = {
            devNodes = "/dev/disk/by-id";
            forceImportRoot = false;
          };
        };

        services.zfs.autoScrub.enable = true;
      }

      (mkIf cfg.ssd.enable {
        # Only trims ssds.
        services.fstrim.enable = false;
        services.zfs.trim.enable = true;
      })
    ]))
  ]);
}
