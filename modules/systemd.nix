{ config, ... }:

{
  config = {
    extraSystemdUnitPaths = [
      "${config.modules.user.home}/.local/share/systemd"
    ];

    modules.home-manager = {
      home.shellAliases = {
        "reboot" = "systemd reboot";
      };
    };
  };
}
