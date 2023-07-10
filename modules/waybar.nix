{ config
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
          position = "top";
          height = 24;

          modules-left = [ "sway/workspaces" "sway/mode" ];
          modules-center = [ "sway/window" ];
          modules-right = [ "cpu" "memory" "disk" "network" "pulseaudio" "battery" "clock" "tray" ];

          "sway/workspaces" = {
            format = "{icon}";
            format-icons = {
              "urgent" = "";
              "focused" = "";
              "default" = "";
            };
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
            format = " {}%";
            states = {
              warning = 70;
              critical = 90;
            };
          };

          "disk" = {
            interval = 30;
            format = "💽{percentage_free}%";
            path = "/";
          };
          "pulseaudio" = {
            format = "{icon} {volume}%";
            format-bluetooth = "{icon} {volume}%";
            format-muted = " 0%";
            format-icons = {
              "headphones" = "";
              "handsfree" = "";
              "headset" = "";
              "phone" = "";
              "portable" = "";
              "car" = "";
              "default" = [ "" "" ];
            };
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

      style = builtins.readFile ../config/waybar/style.css;
    };
  };
}
