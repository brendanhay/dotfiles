{ config, pkgs, lib, system, inputs, ... }:

with lib;

{
  imports = [
    ../modules
  ];

  system.stateVersion = mkDefault "23.11";

  environment = {
    variables = {
      NIXPKGS_ALLOW_UNFREE = "1";
    };

    systemPackages = with pkgs; [
      busybox
      curl
      git
      gnumake
      ripgrep
      wget
      unzip
    ];
  };

  nixpkgs.overlays = [
    inputs.nur.overlay
  ];

  nix = {
    package = pkgs.nixFlakes;

    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      substituters = [ "https://nix-community.cachix.org" ];
      trusted-public-keys = [ "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs=" ];
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

  networking = {
    wireless.enable = false;

    networkmanager = {
      enable = true;
      ethernet.macAddress = "random";
      wifi.macAddress = "random";
    };

    # ${optionalString config.services.xserver.enable (builtins.readFile inputs.blocklist)}
    # extraHosts = ''
    # Block garbage
    #'';
  };

  console = {
    enable = true;
    useXkbConfig = true;
  };

  services.xserver = {
    enable = true;
    autorun = false;
    xkbOptions = "caps:swapescape";

    libinput = {
      enable = true;
      mouse = {
        leftHanded = true;
        accelProfile = "flat";
        accelSpeed = "0";
      };
      touchpad = {
        leftHanded = true;
        accelProfile = "flat";
        accelSpeed = "0";
      };
    };
  };

  programs.ssh.startAgent = true;
}
