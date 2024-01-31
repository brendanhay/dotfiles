{ inputs, config, pkgs, lib, ... }:

with lib;

let
  cfg = config.modules.autoupgrade;
in
{
  options.modules.autoupgrade = {
    enable = mkOption {
      type = types.bool;
      default = false;
    };
  };

  config = mkIf cfg.enable {
    system.autoUpgrade = {
      enable = true;
      flake = inputs.self.outPath;
      flags = [
        "--update-input"
        "nixpkgs"
        "-L" # print build logs
      ];
      dates = "02:00";
      randomizedDelaySec = "45min";
    };
  };
}
