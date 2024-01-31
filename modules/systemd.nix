{ config, ... }:

{
  config = {
    boot.extraSystemdUnitPaths = [
      "${config.modules.user.home}/.local/share/systemd"
    ];

    modules.home-manager = {
      home.shellAliases = {
        "reboot" = "systemctl reboot";
        "suspend" = "systemctl suspend";
      };
    };
  };
}
