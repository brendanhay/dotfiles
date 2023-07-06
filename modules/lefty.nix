{ config, lib, ... }:

with lib;
with lib.my; 
let cfg = config.modules.lefty;
in {
  options.modules.lefty = {
    enable = mkBoolOpt true;
  };

  config = mkIf cfg.enable {
    console.useXkbConfig = true;

    services.xserver = {
      xkbOptions = "caps:swapescape";
      libinput = {
        leftHanded = true;
        naturalScrolling = false;
      };
    };
  };
}
