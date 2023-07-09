{ config, options, pkgs, lib, ... }:

with lib;

let
  cfg = config.modules.zsh;
in
{
  options.modules.zsh = with types; {
    enable = mkOption {
      type = types.bool;
      default = false;
    };
  };

  config = mkIf cfg.enable {
    programs.zsh.enable = true;

    users.defaultUserShell = pkgs.zsh;

    environment.pathsToLink = [ "/share/zsh" ];

    modules.home-manager = {
      programs.zsh = {
        enable = true;
        enableCompletion = true;
        enableAutosuggestions = true;
        enableVteIntegration = true;
      };
    };

    # env = {
    # ZDOTDIR = "$XDG_CONFIG_HOME/zsh";
    # ZSH_CACHE = "$XDG_CACHE_HOME/zsh";
    # ZGEN_DIR = "$XDG_DATA_HOME/zgenom";
    # };

    #    home.configFile = {
    #      # Write it recursively so other modules can write files to it
    #      "zsh" = { source = "${configDir}/zsh"; recursive = true; };
    #
    #      # Why am I creating extra.zsh{rc,env} when I could be using extraInit?
    #      # Because extraInit generates those files in /etc/profile, and mine just
    #      # write the files to ~/.config/zsh; where it's easier to edit and tweak
    #      # them in case of issues or when experimenting.
    #      "zsh/extra.zshrc".text =
    #        let aliasLines = mapAttrsToList (n: v: "alias ${n}=\"${v}\"") cfg.aliases;
    #        in ''
    #          # This file was autogenerated, do not edit it!
    #          ${concatStringsSep "\n" aliasLines}
    #          ${concatMapStrings (path: "source '${path}'\n") cfg.rcFiles}
    #          ${cfg.rcInit}
    #        '';
    #
    #      "zsh/extra.zshenv".text = ''
    #        # This file is autogenerated, do not edit it!
    #        ${concatMapStrings (path: "source '${path}'\n") cfg.envFiles}
    #        ${cfg.envInit}
    #      '';
    #    };
    #
    #    system.userActivationScripts.cleanupZgen = ''
    #      rm -rf $ZSH_CACHE
    #      rm -fv $ZGEN_DIR/init.zsh{,.zwc}
    #    '';
  };
}
