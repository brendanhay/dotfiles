{ config, options, pkgs, lib, inputs, ... }:

let
  cfg = config.dotfiles;
in
{
  imports = [
    inputs.home-manager.nixosModules.home-manager
    (pkgs.lib.mkAliasOptionModule [ "user" ] [ "home-manager" "users" "bren" ])
  ];

  options.dotfiles = {
    user = lib.mkOption {
      type = lib.types.attrs;
      description = "The primary/implicit user account for the current host.";
      default = { };
    };

    env = lib.mkOption {
      type = with lib.types; lazyAttrsOf (oneOf [ str path int float ]);
      description = "home-manager's sessionVariables to set on login.";
      default = { };
    };

    file = lib.mkOption {
      type = lib.types.path;
      description = "Files written to $HOME.";
      default = { };
    };

    configFile = lib.mkOption {
      type = lib.types.attrs;
      description = "Files written to $XDG_CONFIG_HOME.";
      default = { };
    };

    dataFile = lib.mkOption {
      type = lib.types.attrs;
      description = "Files written to $XDG_DATA__HOME.";
      default = { };
    };
  };

  config = {
    dotfiles.user = rec {
      uid = 1000;
      name = config.user.name;
      home = "/home/${name}";
      isNormalUser = true;
      extraGroups = [ "wheel" ];
    };

    users.users.${config.dotfiles.user.name} = lib.mkAliasDefinitions options.dotfiles.user;

    # home-manager is only used to manage the user's environment and $HOME + $XDG_* files.
    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;

      users.${config.dotfiles.user.name} = {
        home = {
          stateVersion = config.system.stateVersion;
          file = lib.mkAliasDefinitions options.dotfiles.file;
        };

        xdg = {
          configFile = lib.mkAliasDefinitions options.dotfiles.configFile;
          dataFile = lib.mkAliasDefinitions options.dotfiles.dataFile;
        };
      };
    };
  };
}
