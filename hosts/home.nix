{
  config,
  pkgs,
  lib,
  system,
  inputs,
  my,
  ...
}: let
  blocklist = builtins.fetchurl https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts;
in {
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ../modules
  ];

  system.stateVersion = lib.mkDefault "23.11";

  #  home-manager = {
  #    useGlobalPkgs = true;
  #    useUserPackages = true;
  #    extraSpecialArgs = { inherit system inputs; };
  #  };

  environment = {
    variables = {
      NIXPKGS_ALLOW_UNFREE = "1";
      DOTFILES = config.dotfiles.dir;
      DOTFILES_BIN = config.dotfiles.binDir;
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

  nix = {
    package = pkgs.nixFlakes;

    settings = {
      experimental-features = ["nix-command" "flakes"];
      substituters = ["https://nix-community.cachix.org"];
      trusted-public-keys = ["nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="];
      trusted-users = ["root" "@wheel"];
      allowed-users = ["root" "@wheel"];
      auto-optimise-store = true;
      warn-dirty = false;
      log-lines = 25;
      connect-timeout = 5;
    };

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 21d";
    };

    # Make the nixpkgs flake input be used for various nix commands
    nixPath = ["nixpkgs=${inputs.nixpkgs}"];

    registry.nixpkgs = {
      flake = inputs.nixpkgs;
      from = {
        id = "nixpkgs";
        type = "indirect";
      };
    };
  };

  i18n.defaultLocale = lib.mkDefault "en_US.UTF-8";

  time.timeZone = lib.mkDefault "Auckland/Pacific";

  location =
    if config.time.timeZone == "Auckland/Pacific"
    then {
      latitude = 36.85;
      longitude = -174.76;
    }
    else {};

  networking = {
    wireless.enable = false;

    networkmanager = {
      enable = true;
      ethernet.macAddress = "random";
      wifi.macAddress = "random";
    };

    extraHosts = ''
      # Block garbage
      ${lib.optionalString config.services.xserver.enable (builtins.readFile blocklist)}
    '';
  };
}
