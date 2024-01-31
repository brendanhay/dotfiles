{ config, pkgs, lib, system, inputs, ... }:

with lib;

{
  imports = [
    ../modules
  ];

  system.stateVersion = mkDefault "23.11";

  environment.systemPackages = with pkgs; [
    curl
    git
    gnumake
    usbutils
    pciutils
    ripgrep
    wget
    unzip
  ];

  nixpkgs = {
    config.allowUnfree = true;
    overlays = [
      inputs.nur.overlay
    ];
  };

  nix = {
    package = pkgs.nixFlakes;

    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      substituters = [ ];
      trusted-users = [ "root" "@wheel" ];
      allowed-users = [ "root" "@wheel" ];
      auto-optimise-store = true;
      connect-timeout = 5;
      warn-dirty = false;
      log-lines = 25;
    };

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 21d";
    };

    # Use the flake's input.nixpkgs as the default <nixpkgs> for all `nix` commands.
    nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];

    registry.nixpkgs = {
      flake = inputs.nixpkgs;
      from = {
        id = "nixpkgs";
        type = "indirect";
      };
    };
  };

  time.timeZone = mkDefault "Pacific/Auckland";

  i18n.defaultLocale = "en_US.UTF-8";

  location =
    if config.time.timeZone == "Pacific/Auckland"
    then {
      latitude = 36.85;
      longitude = -174.76;
    }
    else { };

  console = {
    enable = true;
    useXkbConfig = true;
  };

  # FIXME: move to modules/bluetooth.nix
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  services.xserver = {
    enable = true;
    autorun = false;
  };

  programs.ssh.startAgent = true;
}
