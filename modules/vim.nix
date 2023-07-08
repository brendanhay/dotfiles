{ config, options, pkgs, lib, ... }:

with lib;
let
  cfg = config.modules.editors.vim;
  env = {
    "VISUAL" = "nvim";
    "EDITOR" = "nvim";
  };
in
{
  options.modules.editors.vim = {
    enable = mkOption {
      type = types.bool;
      default = false;
    };
  };

  config = mkIf cfg.enable {
    environment = {
      systemPackages = with pkgs; [ unstable.neovim ];
      sessionVariables = env;
    };

    modules.home-manager = {
      neovim = {
        enable = true;
        package = unstable.neovim;
      };

      home-manager.sessionVariables = env;
    };
  };
}
