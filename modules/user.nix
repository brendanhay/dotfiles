{ config, options, pkgs, lib, inputs, username, ... }:

with lib;

let
  cfg = config.dotfiles;
in
{
  imports = [
    inputs.home-manager.nixosModules.home-manager
    (mkAliasOptionModule [ "modules" "home-manager" ] [ "home-manager" "users" username ])
  ];

  options.modules.user = mkOption {
    type = types.attrs;
    description = "The primary/implicit user account for the current host.";
    default = { };
  };

  config = {
    modules.user = {
      uid = 1000;
      name = username;
      home = "/home/${config.modules.user.name}";
      isNormalUser = true;
      extraGroups = [ "wheel" ];
    };

    users.users.${config.modules.user.name} = mkAliasDefinitions options.modules.user;

    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
    };

    modules.home-manager.home = {
      username = config.modules.user.name;
      homeDirectory = config.modules.user.home;
      stateVersion = config.system.stateVersion;
    };
  };
}
