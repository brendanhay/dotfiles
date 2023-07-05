{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [
    ../configuration.nix
    ./hardware-configuration.nix
  ];

  modules = {
    theme.active = "alucard";

    desktop = {
      bspwm.enable = true;

      apps = {
        rofi.enable = true;
        godot.enable = false;
      };

      browsers = {
        default = "brave";

        brave.enable = true;
        firefox.enable = true;
        qutebrowser.enable = true;
      };

      gaming = {
        steam.enable = true;
      };

      media = {
        daw.enable = false;
        documents.enable = true;
        graphics.enable = false;
        mpv.enable = false;
        recording.enable = false;
        spotify.enable = false;
      };

      term = {
        default = "xst";
        st.enable = true;
      };

      vm = {
        qemu.enable = false;
      };
    };

    dev = {
      node.enable = true;
      rust.enable = true;
      python.enable = true;
    };

    editors = {
      default = "vim";

      emacs.enable = true;
      vim.enable = true;
    };

    shell = {
      adl.enable = false;
      direnv.enable = true;
      git.enable = true;
      gnupg.enable = true;
      tmux.enable = true;
      zsh.enable = true;
    };

    services = {
      ssh.enable = true;
      docker.enable = true;
    };

    hardware = {
      amdgpu.enable = true;
      audio.enable = true;
      fs = {
        enable = true;
        zfs.enable = true;
        ssd.enable = true;
      };
    };
  };

  programs.ssh.startAgent = true;

  networking = {
    hostName = "exult";
    hostId = "06b7bfc8";

    wireless.interfaces = ["wlp3s0"];
  };

  powerManagement.powertop.enable = true;

  programs.light.enable = true;

  environment.systemPackages = [pkgs.acpi];
}
