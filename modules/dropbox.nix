{ pkgs, config, lib, ... }:

with lib;

let
  cfg = config.modules.dropbox;
  homeDir = config.modules.home-manager.home.homeDirectory;
in
{
  options.modules.dropbox = {
    enable = mkOption {
      type = types.bool;
      default = false;
    };

    path = mkOption {
      type = types.path;
      default = "${homeDir}/Dropbox";
      defaultText =
        literalExpression ''"''${homeDir}/Dropbox"'';
      apply = toString; # Prevent copies to Nix store.
      description = "Where to put the Dropbox directory.";
    };
  };

  config = mkIf cfg.enable {
    nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
      "dropbox"
    ];

    modules.home-manager = {
      home.packages = with pkgs; [
        dropbox-cli
        maestral
      ];

      services.dropbox = {
        enable = true;
        path = cfg.path;
      };
    };
  };
}
