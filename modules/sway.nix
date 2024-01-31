{ config, pkgs, lib, ... }:

with lib;

let
  cfg = config.modules.sway;
  rofiHome = "${config.modules.home-manager.xdg.configHome}/rofi";
in
{
  options.modules.sway = {
    enable = mkOption {
      type = types.bool;
      default = false;
    };

    terminal = mkOption {
      type = types.str;
      default = "foot";
    };
  };

  config = mkIf cfg.enable {
    environment.pathsToLink = [ "/libexec" ];

    security.polkit.enable = true;
    services.dbus.enable = true;
    programs.dconf.enable = true;

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

    # For brightness/backlight keybinds in sway config. 
    # Only required for light, not brightnessctl.
    modules.user.extraGroups = [ "video" ];

    modules.home-manager = {
      home.packages = with pkgs; [
        tdesktop

        brightnessctl
        cached-nix-shell # rofi/bin/bwmenu
        fd # rofi/bin/filemenu
        mpc_cli
        wev # Get key codes for bindsym on wayland.
        wlr-randr
        wl-clipboard
      ];

      wayland.windowManager.sway = {
        enable = true;
        package = null; # Use nixos/system sway.

        config = rec {
          modifier = "Mod4";
          terminal = cfg.terminal;

          focus.followMouse = true;

          # swaymsg -t get_inputs
          input = {
            # "1:1:AT_Translated_Set_2_keyboard" = {
            #   xkb_options = "caps:swapescape";
            # };

            # "2131:791:Topre_REALFORCE_X1U_US_TKL" = {
            #   xkb_options = "caps:swapescape";
            # };

            # "12136:130:Hoksi_Technology_DURGOD_Taurus_K320" = {
            #   # "12136:130:Hoksi_Technology_DURGOD_Taurus_K320_Keyboard" = {
            #   xkb_options = "caps:swapescape";
            # };

            # Touchpad
            "2:7:SynPS/2_Synaptics_TouchPad" = {
              left_handed = "enabled";
              accel_profile = "flat";
              pointer_accel = "0";
            };

            # Touchpad Buttons
            "6058:20564:ThinkPad_Extra_Buttons" = {
              left_handed = "enabled";
            };

            # Zowie S2C
            "1189:32769:BenQ_ZOWIE_BenQ_ZOWIE_Gaming_Mouse" = {
              left_handed = "enabled";
              accel_profile = "flat";
              pointer_accel = "0";
            };

            # Pulsar X2 Mini Wireless
            "9639:64124:Compx_X2_Mini_Wireless" = {
              left_handed = "disabled"; # Enabled in mouse firmware.
              accel_profile = "flat";
              pointer_accel = "0";
            };
          };

          output = {
            "*" = {
              background = "#22232d solid_color";
            };
          };

          window = {
            titlebar = false;
            border = 1;
          };

          floating = {
            titlebar = true;
            border = 1;
          };

          gaps = {
            smartBorders = "on";
            smartGaps = true;
            outer = 1;
            inner = 1;
          };

          colors = {
            focused = {
              background = "#1d2028";
              border = "#bd93f9";
              childBorder = "#285577";
              indicator = "#2e9ef4";
              text = "#ffffff";
            };

            unfocused = {
              background = "#1d2028";
              border = "#181a23";
              childBorder = "#222222";
              indicator = "#292d2e";
              text = "#888888";
            };
          };

          assigns = {
            "0" = [{ app_id = "^.blueman-applet-wrapped$"; }];
          };

          keybindings = lib.mkOptionDefault {
            # Unbind Defaults
            "${modifier}+d" = null;

            # Application Launchers
            "${modifier}+Return" = "exec ${terminal}";
            "${modifier}+space" = "exec ${rofiHome}/bin/appmenu";
            "${modifier}+Tab" = "exec ${rofiHome}/rofi/bin/windowmenu";
            "${modifier}+p" = "exec ${rofiHome}/rofi/bin/bwmenu";
            "${modifier}+Shift+p" = "exec ${rofiHome}/rofi/bin/bwmenu -r";
            "${modifier}+slash" = "exec ${rofiHome}/rofi/bin/filemenu -x";

            # Screen Lock
            "${modifier}+Backspace" = "exec ${pkgs.swaylock}/bin/swaylock -c 000000";

            # Window Management
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

            # Brightness
            "--locked XF86MonBrightnessDown" = "exec brightnessctl set 5%-";
            "--locked XF86MonBrightnessUp" = "exec brightnessctl set +5%";

            # Volume
            "XF86AudioRaiseVolume" = "exec wpctl set-volume -l 1.1 @DEFAULT_AUDIO_SINK@ 5%+";
            "XF86AudioLowerVolume" = "exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
            "--locked XF86AudioMute" = "exec wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
            "--locked XF86AudioMicMute" = "exec wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";

            # Multimedia
            "XF86AudioPrev" = "exec mpc -q next";
            "XF86AudioNext" = "exec mpc -q prev";
            "XF86AudioPlay" = "exec mpc -q toggle";
            "--locked XF86AudioPause" = "exec mpc -q toggle";

            # Durgod Taurus - right Menu to modifier
            "Menu" = "${modifier}";
          };
        };
      };
    };
  };
}

