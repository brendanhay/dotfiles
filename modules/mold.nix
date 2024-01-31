{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.modules.mold;
in
{
  options.modules.mold = {
    enable = mkOption {
      type = types.bool;
      default = false;
    };
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      mold
    ];

    modules.home-manager = {
      home.file.".cargo/config.toml".text = ''
        [target.x86_64-unknown-linux-gnu]
        linker = "clang"
        rustflags = ["-C", "link-arg=-fuse-ld=${pkgs.mold}/bin/mold"]
      '';
    };
  };
}
