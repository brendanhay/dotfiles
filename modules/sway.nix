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

    xdg.portal = {
      enable = true;
      wlr.enable = true;
      extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    };

    programs.light.enable = true;

    #  programs.sway = {
    #    enable = true;
    #    wrapperFeatures.gtk = true; # so that gtk works properly
    #    extraSessionCommands = ''
    #      export SDL_VIDEODRIVER=wayland
    #      export QT_QPA_PLATFORM=wayland
    #      export QT_WAYLAND_DISABLE_WINDOWDECORATION="1"
    #      export _JAVA_AWT_WM_NONREPARENTING=1
    #      export MOZ_ENABLE_WAYLAND=1
    #    '';
    #  };

    modules.home-manager.wayland.windowManager.sway = {
      enable = true;
      # package = null;
      systemd.enable = true;
      wrapperFeatures.gtk = true;
      extraSessionCommands = ''
        export SDL_VIDEODRIVER=wayland
        export QT_QPA_PLATFORM=wayland
        export QT_WAYLAND_DISABLE_WINDOWDECORATION="1"
        export _JAVA_AWT_WM_NONREPARENTING=1
        export MOZ_ENABLE_WAYLAND=1
      '';
      config = {
        modifier = "Mod4";
      };
    };

    # For brightness/backlight keybinds in sway config.
    modules.user.extraGroups = [ "video" ];
  };
}

