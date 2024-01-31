{ config, pkgs, lib, ... }:

with lib;

let
  cfg = config.modules.borgmatic;
in
{
  options.modules.borgmatic = {
    enable = mkOption {
      type = types.bool;
      default = false;
    };
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      borgbackup
    ];

    modules.home-manager = {
      services.borgmatic = {
        enable = true;
        frequency = "hourly";
      };

      programs.borgmatic = {
        enable = true;
        backups = { };
      };

      # self/
      # code/

      # ignore
      # 	.direnv
      # 	tmp
      # 	.cache
      # 	bazel-*
      # 	.stack-work
      # 	dist-newstyle
      # 	target
      #   .d
      #   .rmeta
      #   .rlib
      # 	result*

      home.sessionVariables = {
        BORG_RSH = "ssh -i $HOME/.ssh/id_borgbackup";
      };
    };
  };
}
