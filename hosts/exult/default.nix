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
      power.enable = true;
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
      helix.enable = false;
      vim.enable = true;
    };

    network = {
      enable = true;
      forward = false;
    };

    alacritty.enable = true;
    autoupgrade.enable = true;
    borgmatic.enable = true;
    clamav.enable = true;
    direnv.enable = true;
    docker.enable = true;
    dropbox.enable = true;
    firefox.enable = true;
    fonts.enable = true;
    git.enable = true;
    gpg.enable = true;
    gtk.enable = true;
    kanshi.enable = true;
    mime.enable = true;
    mold.enable = true;
    readline.enable = true;
    steam.enable = true;
    sway.enable = true;
    swaylock.enable = true;
    tailscale.enable = true;
    zsh.enable = true;
    rofi.enable = true;

    kmonad.keyboards = {
      topre-realforce-x1u = {
        enable = true;
        config = builtins.readFile ../../keyboards/topre-realforce-x1u.kbd;
      };

      p14s-internal = {
        enable = true;
        config = builtins.readFile ../../keyboards/p14s-internal.kbd;
      };
    };
  };
}
