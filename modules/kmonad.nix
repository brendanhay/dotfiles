{ config, pkgs, lib, inputs, ... }:

with lib;

let
  cfg = config.modules.kmonad;

  keyboard = { name, ... }: {
    options = {
      name = mkOption {
        type = types.str;
        readOnly = true;
        description = ''
          Unique name of the keyboard. This is set to the attribute name of the
          keyboard configuration.
        '';
      };

      enable = mkOption {
        type = types.bool;
        default = false;
        description = ''
          Whether to enable the kmonad service for this keyboard.
        '';
      };

      config = mkOption {
        type = types.lines;
        default = "";
        description = ''
          The kmonad configuration for this keyboard.
        '';
      };
    };

    config = { name = mkDefault name; };
  };
in
{
  options.modules.kmonad = {
    keyboards = mkOption {
      type = types.attrsOf (types.submodule keyboard);
      default = { };
      description = "List of keyboard configurations.";
    };

    package = mkOption {
      type = types.package;
      example = "pkgs.kmonad";
      default = pkgs.kmonad;
      description = ''
        The kmonad package.
      '';
    };
  };

  config =
    let
      enabledKeyboards = filterAttrs (_name: keyboard: keyboard.enable) cfg.keyboards;

      mkConfigFile = name: keyboard:
        nameValuePair "kmonad/kmonad-${name}.kbd" { text = keyboard.config; };

      mkSystemdService = name: _keyboard:
        nameValuePair "kmonad-${name}" {
          Unit = { Description = "KMonad for ${name}"; };
          Install = { WantedBy = [ "default.target" ]; };
          Service = {
            Type = "simple";
            ExecStart = "${cfg.package}/bin/kmonad ${config.modules.home-manager.xdg.configFile."kmonad/kmonad-${name}.kbd".source}";
          };
        };
    in
    mkIf (cfg.keyboards != { }) {
      nixpkgs.overlays = [ inputs.kmonad.overlays.default ];

      hardware.uinput.enable = true;

      modules.user.extraGroups = [ "input" "uinput" ];

      modules.home-manager = {
        xdg.configFile = mapAttrs' mkConfigFile enabledKeyboards;
        systemd.user.services = mapAttrs' mkSystemdService enabledKeyboards;
      };
    };
}
