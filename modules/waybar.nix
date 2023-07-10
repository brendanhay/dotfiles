{ config
, pkgs
, lib
, ...
}:
with lib; let
  cfg = config.modules.waybar;
in
{
  options.modules.waybar = {
    enable = mkOption {
      type = types.bool;
      default = false;
    };
  };

  config = mkIf cfg.enable {
    modules.home-manager.programs.waybar = {
      enable = true;
      settings = [
        {
          layer = "top";
          position = "bottom";
          height = 28;

          modules-left = [ "pulseaudio" "cpu" "memory" "disk" ];
          modules-center = [ "sway/workspaces" ];
          modules-right = [ "network" "battery" "clock" "tray" ];

          "sway/workspaces" = {
            all-outputs = true;
            numeric-first = true;
            format = "{name}";
          };

          "network" = {
            format-wifi = " {essid} ({signalStrength}%)";
            format-ethernet = " {ifname}: {ipaddr}/{cidr}";
            format-disconnected = "Disconnected ⚠";
          };

          "cpu" = {
            interval = 5;
            format = " {usage}%";
            states = {
              warning = 70;
              critical = 90;
            };
          };

          "memory" = {
            interval = 5;
            format = " {}%";
            states = {
              warning = 70;
              critical = 90;
            };
          };

          "disk" = {
            interval = 30;
            format = "💽{percentage_free}%";
            path = "/home";
          };

          "pulseaudio" = {
            format = "{icon} {volume}%";
            format-bluetooth = "{icon} {volume}%";
            format-muted = " 0%";
            format-icons = {
              "default" = [ "" ];
            };
            on-click = "${pkgs.pavucontrol}/bin/pavucontrol";
          };

          "battery" = {
            bat = "BAT0";
            states = {
              "warning" = 30;
              "critical" = 15;
            };
            format = "{icon}  {capacity}%";
            format-icons = [ "" "" "" "" "" ];
          };

          "clock" = {
            format = "{:%a %d %b %H:%M}";
          };
        }
      ];

      # style = builtins.readFile ../config/waybar/style.css;
    };
  };
}
