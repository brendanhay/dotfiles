{ config, options, pkgs, lib, ... }:

let
  cfg = config.modules.hardware.filesystem;
in
{
  options.modules.hardware.filesystem = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };

    zfs.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };

    ssd.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };

  config = lib.mkIf cfg.enable (lib.mkMerge [
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

    (lib.mkIf cfg.zfs.enable (lib.mkMerge [
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

      (lib.mkIf cfg.ssd.enable {
        # Only trims ssds.
        services.fstrim.enable = false;
        services.zfs.trim.enable = true;
      })
    ]))
  ]);
}
