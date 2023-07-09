{ config, pkgs, lib, ... }:

{
  imports = [
    ../configuration.nix
    ./hardware-configuration.nix
  ];

  time.timeZone = "Pacific/Auckland";

  networking = {
    hostName = "exult";
    hostId = "06b7bfc8";
  };

  modules = {
    hardware = {
      audio.enable = true;
      amdgpu.enable = true;
      filesystem = {
        enable = true;
        zfs.enable = true;
        ssd.enable = true;
      };
    };

    editors = {
      emacs.enable = true;
      vim.enable = true;
    };

    alacritty.enable = true;
    firefox.enable = true;
    fonts.enable = true;
    git.enable = true;
    readline.enable = true;
    sway.enable = true;
  };
}
