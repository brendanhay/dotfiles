{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.modules.ssh;
in
{
  options.modules.ssh = {
    enable = mkOption {
      type = types.bool;
      default = false;
    };
  };

  config = mkIf cfg.enable { }
