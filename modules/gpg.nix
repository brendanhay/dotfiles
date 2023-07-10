{ config, lib, ... }:

with lib;

let
  cfg = config.modules.gpg;
in
{
  options.modules.gpg = {
    enable = mkOption {
      type = types.bool;
      default = false;
    };
  };

  config = mkIf cfg.enable {
    environment.variables.GNUPGHOME = "$XDG_CONFIG_HOME/gnupg";

    programs.gnupg.agent.enable = true;

    modules.home-manager.packages = with pkgs; [
      tomb
    ];

    modules.home-manager.xdg.configFile."gnupg/gpg-agent.conf" = {
      text = ''
        	    default-cache-ttl 3600
        	    pinentry-program ${pkgs.pinentry.gtk2}/bin/pinentry
        	   '';
    };
  };
}
