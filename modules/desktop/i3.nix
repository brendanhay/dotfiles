{ options, config, lib, pkgs, ... }:

with lib;
with lib.my;
let cfg = config.modules.desktop.i3;
    configDir = config.dotfiles.configDir;
in {
  options.modules.desktop.i3 = {
    enable = mkBoolOpt false;
  };

  config = mkIf cfg.enable {
    environment.pathsToLink = [ "/libexec" ];
    environment.systemPackages = with pkgs; [
      lightdm
      dunst
      libnotify
      (polybar.override {
        pulseSupport = true;
        nlSupport = true;
      })

      xss-lock
      nm-applet
      pactl
    ];

    services = {
      redshift.enable = true;

      picom = {
        enable = true;
        vSync = true;
      };

      xserver = {
        enable = true;
        displayManager = {
          defaultSession = "none+i3";
          lightdm.enable = true;
          lightdm.greeters.mini.enable = true;
        };
        windowManager.i3.enable = true;
      };
    };

    systemd.user.services."dunst" = {
      enable = true;
      description = "";
      wantedBy = [ "default.target" ];
      serviceConfig.Restart = "always";
      serviceConfig.RestartSec = 3;
      serviceConfig.ExecStart = "${pkgs.dunst}/bin/dunst";
    };

    # link recursively so other modules can link files in their folders
    home.configFile = {
      "i3" = {
        source = "${configDir}/i3";
        recursive = true;
      };
    };
  };
}
