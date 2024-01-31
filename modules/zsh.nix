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
    users.defaultUserShell = pkgs.zsh;

    environment.shells = with pkgs; [ zsh ];
    environment.pathsToLink = [ "/share/zsh" ];

    programs.zsh = {
      enable = true;
      enableCompletion = true;
      enableBashCompletion = true;
      enableGlobalCompInit = false;
    };

    modules.home-manager = {
      xdg.configFile."zsh/config.zsh".source = ../config/zsh/config.zsh;
      xdg.configFile."zsh/keybinds.zsh".source = ../config/zsh/keybinds.zsh;
      xdg.configFile."zsh/prompt.zsh".source = ../config/zsh/prompt.zsh;

      home.packages = with pkgs;
        [
          eza
          fasd
          fzf
        ];

      programs.zsh = {
        enable = true;
        enableCompletion = true;
        enableVteIntegration = true;
        # completionInit = "";
        dotDir = ".config/zsh";

        autosuggestion.enable = true;

        antidote = {
          enable = true;
          useFriendlyNames = true;
          plugins = [
            "junegunn/fzf path:shell"
            "jeffreytse/zsh-vi-mode"
            "zdharma-continuum/fast-syntax-highlighting kind:defer"
            "zsh-users/zsh-completions"
            "zsh-users/zsh-autosuggestions"
            "zsh-users/zsh-history-substring-search"
            "romkatv/powerlevel10k"
            "hlissner/zsh-autopair kind:defer"
          ];
        };

        initExtraBeforeCompInit = ''
          source "$HOME/.config/zsh/keybinds.zsh"
          source "$HOME/.config/zsh/config.zsh"
          source "$HOME/.config/zsh/prompt.zsh"
        '';
      };
    };

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

  };
}
