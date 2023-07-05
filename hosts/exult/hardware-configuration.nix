{
  config,
  pkgs,
  lib,
  inputs,
  modulesPath,
  ...
}: let
  diskName = "nvme-Samsung_SSD_970_EVO_Plus_2TB_S4J4NM0R712001B";
  efiPartition = "${diskName}-part2";
  efiRemovable = true;
in {
  imports = [
    "${modulesPath}/installer/scan/not-detected.nix"
    inputs.nixos-hardware.nixosModules.lenovo-thinkpad-p14s-amd-gen2
  ];

  boot = {
    initrd = {
      availableKernelModules = ["ahci" "nvme" "xhci_pci" "ahci" "usb_storage" "usbhid" "sd_mod" "rtsx_pci_sdmmc"];
      kernelModules = [];
    };

    kernelModules = ["kvm-amd"];
    kernelParams = ["amd_pstate=active" "systemd.gpt_auto=0" "mitigations=off"];
    extraModulePackages = [];
    extraModprobeConfig = "options kvm_amd nested=1";

    loader = {
      generationsDir.copyKernels = true;

      efi = {
        canTouchEfiVariables = false;
        efiSysMountPoint = "/boot/efis/${efiPartition}";
      };

      grub = {
        enable = true;
        devices = ["/dev/disk/by-id/${diskName}"];
        splashImage = null;
        copyKernels = true;
        efiInstallAsRemovable = true;
        efiSupport = true;
      };
    };
  };

  hardware = {
    cpu.amd.updateMicrocode = true;
    enableRedistributableFirmware = true;
  };

  #  # Displays
  #  services.xserver = {
  #    # This must be done manually to ensure my screen spaces are arranged exactly
  #    # as I need them to be *and* the correct monitor is "primary". Using
  #    # xrandrHeads does not work.
  #    monitorSection = ''
  #      VendorName  "Unknown"
  #      ModelName   "DELL U2515H"
  #      HorizSync   30.0 - 113.0
  #      VertRefresh 56.0 - 86.0
  #      Option      "DPMS"
  #    '';
  #    screenSection = ''
  #      Option "metamodes" "HDMI-0: nvidia-auto-select +1920+0, DVI-I-1: nvidia-auto-select +0+180, DVI-D-0: nvidia-auto-select +4480+180"
  #      Option "SLI" "Off"
  #      Option "MultiGPU" "Off"
  #      Option "BaseMosaic" "off"
  #      Option "Stereo" "0"
  #      Option "nvidiaXineramaInfoOrder" "DFP-1"
  #    '';
  #  };

  # Storage
  fileSystems = {
    "/" = {
      device = "/dev/disk/by-label/nixos";
      fsType = "ext4";
      options = ["noatime"];
    };
    "/boot" = {
      device = "/dev/disk/by-label/BOOT";
      fsType = "vfat";
    };
    "/home" = {
      device = "/dev/disk/by-label/home";
      fsType = "ext4";
      options = ["noatime"];
    };
    "/usr/drive" = {
      device = "kiiro:/volume1/homes/hlissner/Drive";
      fsType = "nfs";
      options = [
        "nofail"
        "noauto"
        "noatime"
        "x-systemd.automount"
        "x-systemd.idle-timeout=5min"
        "nodev"
        "nosuid"
        "noexec"
      ];
    };
    "/usr/store" = {
      device = "/dev/disk/by-label/store";
      fsType = "ext4";
      options = [
        "noauto"
        "noatime"
        "x-systemd.automount"
        "x-systemd.idle-timeout=5min"
        "nodev"
        "nosuid"
        "noexec"
      ];
    };
  };

  swapDevices = [];
}
