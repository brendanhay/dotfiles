{ config, lib, ... }:

with lib;

let
  cfg = config.modules.git;
in
{
  options.modules.git = {
    enable = mkOption {
      type = types.bool;
      default = false;
    };

    userName = mkOption {
      type = types.str;
      default = "Brendan Hay";
    };

    userEmail = mkOption {
      type = types.str;
      default = "os@brendanhay.nz";
    };

    ignores = mkOption {
      type = types.listOf types.str;
      default = [ ".envrc" ".direnv/" ];
    };
  };

  config = mkIf cfg.enable {
    modules.home-manager.programs.git = {
      enable = true;
      userName = cfg.userName;
      userEmail = cfg.userEmail;
      ignores = cfg.ignores;

      extraConfig = {
        branch.autoSetupRebase = "always";
        checkout.defaultRemote = "origin";

        pull = {
          rebase = true;
          ff = "only";
          default = "current";
        };

        init.defaultBranch = "main";
        submodule.recurse = "true";

        url."ssh://git@".pushInsteadOf = "https://";
      };
    };
  };
}
