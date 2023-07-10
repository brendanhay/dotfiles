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
      systemPackages = with pkgs; [ neovim ];
      sessionVariables = env;
    };

    modules.home-manager = {
      programs.neovim = {
        enable = true;
        #        package = unstable.neovim;
        defaultEditor = true;
        viAlias = true;
        vimAlias = true;
        vimdiffAlias = true;
        extraConfig = ''
          set number
        '';
      };

      home.sessionVariables = env;
    };
  };
}
