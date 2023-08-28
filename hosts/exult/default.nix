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

    network = {
      enable = true;
      forward = true;
    };

    alacritty.enable = true;
    borgmatic.enable = true;
    direnv.enable = true;
    docker.enable = true;
    dropbox.enable = true;
    firefox.enable = true;
    fonts.enable = true;
    git.enable = true;
    gpg.enable = true;
    gtk.enable = true;
    mime.enable = true;
    readline.enable = true;
    sway.enable = true;
    # waybar.enable = true;
    zsh.enable = true;
    rofi.enable = true;
  };
}
