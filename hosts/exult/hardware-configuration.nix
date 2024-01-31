{ config, pkgs, lib, inputs, modulesPath, ... }:

let
  diskName = "nvme-Samsung_SSD_970_EVO_Plus_2TB_S4J4NM0R712001B";
  efiPartition = "${diskName}-part2";
  efiRemovable = true;
in
{
  imports = [
    "${modulesPath}/installer/scan/not-detected.nix"
    inputs.nixos-hardware.nixosModules.lenovo-thinkpad-p14s-amd-gen2
  ];

  boot = {
    initrd = {
      availableKernelModules = [ "ahci" "nvme" "xhci_pci" "ahci" "usb_storage" "usbhid" "sd_mod" "rtsx_pci_sdmmc" ];
      kernelModules = [ ];
    };

    kernelModules = [ "kvm-amd" ];
    kernelParams = [ "amd_pstate=active" "systemd.gpt_auto=0" "mitigations=off" "mem_sleep_default=deep" ];
    extraModulePackages = [ ];
    extraModprobeConfig = "options kvm_amd nested=1";

    loader = {
      generationsDir.copyKernels = true;

      efi = {
        canTouchEfiVariables = false;
        efiSysMountPoint = "/boot/efis/${efiPartition}";
      };

      grub = {
        enable = true;
        devices = [ "/dev/disk/by-id/${diskName}" ];
        splashImage = null;
        copyKernels = true;
        efiInstallAsRemovable = true;
        efiSupport = true;
      };
    };
  };

  hardware.enableRedistributableFirmware = true;

  fileSystems."/" = {
    device = "rpool/nixos/root";
    fsType = "zfs";
    options = [ "noatime" "X-mount.mkdir" ];
    neededForBoot = true;
  };

  fileSystems."/boot" = {
    device = "bpool/nixos/root";
    fsType = "zfs";
    options = [ "noatime" "X-mount.mkdir" ];
    neededForBoot = true;
  };

  fileSystems."/home" = {
    device = "rpool/nixos/home";
    fsType = "zfs";
    options = [ "noatime" "X-mount.mkdir" ];
    neededForBoot = true;
  };

  fileSystems."/var/lib" = {
    device = "rpool/nixos/var/lib";
    fsType = "zfs";
    options = [ "noatime" "X-mount.mkdir" ];
    neededForBoot = true;
  };

  fileSystems."/var/log" = {
    device = "rpool/nixos/var/log";
    fsType = "zfs";
    options = [ "noatime" "X-mount.mkdir" ];
    neededForBoot = true;
  };

  fileSystems."/boot/efis/${efiPartition}" = {
    device = "/dev/disk/by-id/${efiPartition}";
    fsType = "vfat";
    options = [
      "x-systemd.idle-timeout=1min"
      "x-systemd.automount"
      "noauto"
      "nofail"
      "noatime"
      "X-mount.mkdir"
    ];
  };

  swapDevices = [ ];
}
