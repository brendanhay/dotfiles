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
      default = "brendanhay";
    };

    userEmail = mkOption {
      type = types.str;
      default = "brendan.g.hay@gmail.com";
    };

    ignores = mkOption {
      type = types.listOf types.str;
      default = [ ".envrc" ".direnv/" ];
    };
  };

  config = mkIf cfg.enable {
    modules.home-manager = {
      programs.git = {
        enable = true;
        userName = cfg.userName;
        userEmail = cfg.userEmail;
        ignores = cfg.ignores;

        signing = {
          key = "0x1CB98DBC27F93D20";
          signByDefault = true;
        };

        extraConfig = {
          branch.autoSetupRebase = "always";
          checkout.defaultRemote = "origin";
          push.autoSetupRemote = true;
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

      home.shellAliases = {
        "git" = "noglob git";
        "ga" = "git add";
        "gap" = "git add --patch";
        "gc" = "git commit";
        "gcm" = "git commit --message";
        "gcf" = "git commit --fixup";
        "gb" = " git branch";
        "gbl" = "git blame";
        "gcl" = "git clone";
        "gco" = "git checkout";
        "gd" = "git diff";
        "gdc" = "git diff --cached";
        "gl" = "git log";
        "gs" = "git status";
        "gst" = "git stash";
        "gr" = "git reset HEAD";
        "gv" = "git rev-parse";
        "gp" = " git push";
        "gpu" = " git pull";
      };
    };
  };
}
