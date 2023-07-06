{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [
    ../home.nix
    ./hardware-configuration.nix
  ];

  modules = {
    theme.active = "alucard";

    desktop = {
      i3.enable = true;

      apps = {
        rofi.enable = true;
        godot.enable = false;
      };

      browsers = {
        default = "firefox";

        brave.enable = false;
        firefox.enable = true;
      };

      gaming = {
        steam.enable = false;
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
      node.enable = false;
      rust.enable = false;
      python.enable = false;
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
      docker.enable = false;
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
