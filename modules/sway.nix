{ config, pkgs, lib, ... }:

with lib;

let
  cfg = config.modules.sway;
in
{
  options.modules.sway = {
    enable = mkOption {
      type = types.bool;
      default = false;
    };
  };

  config = mkIf cfg.enable {
    environment.pathsToLink = [ "/libexec" ];

    security.polkit.enable = true;

    services.dbus.enable = true;

    programs.dconf.enable = true;

    #services.xserver.enable = true;
    #services.xserver.displayManager.lightdm.enable = true;
    #services.xserver.displayManager.defaultSession = "sway";
    #services.xserver.displayManager.sessionPackages = with pkgs; [ sway ];

    xdg.portal = {
      enable = true;
      wlr.enable = true;
      extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    };

    programs.sway = {
      enable = true;
      wrapperFeatures.gtk = true; # so that gtk works properly
      extraSessionCommands = ''
        export SDL_VIDEODRIVER=wayland
        export QT_QPA_PLATFORM=wayland
        export QT_WAYLAND_DISABLE_WINDOWDECORATION="1"
        export _JAVA_AWT_WM_NONREPARENTING=1
        export MOZ_ENABLE_WAYLAND=1
      '';
    };

    modules.home-manager.wayland.windowManager.sway = {
      enable = true;
      package = null; # Use nixos/system sway.

      config = rec {
        modifier = "Mod4";
        terminal = "alacritty";

        focus.followMouse = true;

        gaps = {
          smartBorders = "on";
          smartGaps = true;
          outer = 1;
          inner = 1;
        };

        window = {
          titlebar = false;
          border = 1;
        };

        floating = {
          titlebar = true;
          border = 1;
        };

        input = {
          "type:keyboard" = {
            xkb_options = "caps:swapescape";
          };

          "type:pointer" = {
            left_handed = "enabled";
          };
        };

        keybindings = lib.mkOptionDefault {
          "${modifier}+h" = "focus left";
          "${modifier}+j" = "focus down";
          "${modifier}+k" = "focus up";
          "${modifier}+l" = "focus right";

          "${modifier}+Shift+h" = "move left";
          "${modifier}+Shift+j" = "move down";
          "${modifier}+Shift+k" = "move up";
          "${modifier}+Shift+l" = "move right";

          "${modifier}+v" = "split v";
          "${modifier}+b" = "split h";

          "${modifier}+Left" = "move workspace to output left";
          "${modifier}+Right" = "move workspace to output right";
          "${modifier}+Up" = "move workspace to output next";

          # Multimedia Keys
          "XF86AudioMute" = "exec ${pkgs.pulseaudio}/bin/pactl set-sink-mute @DEFAULT_SINK@ toggle";
          "XF86AudioMicMute" = "exec ${pkgs.pulseaudio}/bin/pactl set-source-mute @DEFAULT_SOURCE@ toggle";

          "--locked XF86MonBrightnessDown" = "exec ${pkgs.brightnessctl}/bin/brightnessctl set 5%-";
          "--locked XF86MonBrightnessUp" = "exec ${pkgs.brightnessctl}/bin/brightnessctl set +5%";

          "XF86AudioRaiseVolume" = "exec ${pkgs.pulseaudio}/bin/pactl set-sink-volume @DEFAULT_SINK@ +5%";
          "XF86AudioLowerVolume" = "exec ${pkgs.pulseaudio}/bin/pactl set-sink-volume @DEFAULT_SINK@ -5%";

          "XF86AudioPrev" = "exec ${pkgs.mpc_cli}/bin/mpc -q next";
          "XF86AudioNext" = "exec ${pkgs.mpc_cli}/bin/mpc -q prev";
          "XF86AudioPlay" = "exec ${pkgs.mpc_cli}/bin/mpc -q toggle";
          "XF86AudioPause" = "exec ${pkgs.mpc_cli}/bin/mpc -q toggle";
        };
      };
    };

    # For brightness/backlight keybinds in sway config. 
    # Only required for light, not brightnessctl.
    modules.user.extraGroups = [ "video" ];
  };
}

