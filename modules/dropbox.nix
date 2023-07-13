{ pkgs, config, lib, ... }:

with lib;

let
  cfg = config.modules.dropbox;
  baseDir = ".dropbox-hm";
  dropboxCmd = "${pkgs.dropbox-cli}/bin/dropbox";
  homeDir = config.modules.home-manager.home.homeDirectory;
  homeBaseDir = "${config.modules.home-manager.home.homeDirectory}/${baseDir}";
in
{
  options.modules.dropbox = {
    enable = mkOption {
      type = types.bool;
      default = false;
    };

    path = mkOption {
      type = types.path;
      default = "${homeDir}/Dropbox";
      defaultText =
        literalExpression ''"''${homeDir}/Dropbox"'';
      apply = toString; # Prevent copies to Nix store.
      description = "Where to put the Dropbox directory.";
    };
  };

  config = mkIf cfg.enable {
    nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
      "dropbox"
    ];

    modules.home-manager = {
      home.packages = with pkgs; [
        dropbox-cli
      ];

      systemd.user.services.dropbox = {
        Unit = { Description = "dropbox"; };

        Install = { WantedBy = [ "default.target" ]; };

        Service = {
          Environment = [ "HOME=${homeBaseDir}" "DISPLAY=" ];

          Type = "forking";
          PIDFile = "${homeBaseDir}/.dropbox/dropbox.pid";

          Restart = "on-failure";
          PrivateTmp = true;
          ProtectSystem = "full";
          Nice = 10;

          ExecReload = "${pkgs.coreutils}/bin/kill -HUP $MAINPID";
          ExecStop = "${dropboxCmd} stop";
          ExecStart = toString (pkgs.writeShellScript "dropbox-start" ''
                        # ensure we have the dirs we need
                        $DRY_RUN_CMD ${pkgs.coreutils}/bin/mkdir $VERBOSE_ARG -p \
                          ${homeBaseDir}/{.dropbox,.dropbox-dist,Dropbox}

                        # symlink them as needed
                        if [[ ! -d ${homeDir}/.dropbox ]]; then
                          $DRY_RUN_CMD ${pkgs.coreutils}/bin/ln $VERBOSE_ARG -s \
                            ${homeBaseDir}/.dropbox ${homeDir}/.dropbox
                        fi

                        if [[ ! -d ${escapeShellArg cfg.path} ]]; then
                          $DRY_RUN_CMD ${pkgs.coreutils}/bin/ln $VERBOSE_ARG -s \
                            ${homeBaseDir}/Dropbox ${escapeShellArg cfg.path}
                        fi

                        # get the dropbox bins if needed
            #            if [[ ! -f $HOME/.dropbox-dist/VERSION ]]; then
            #              ${pkgs.coreutils}/bin/yes | ${dropboxCmd} update
            #            fi

                        ${dropboxCmd} start
          '');
        };
      };
    };
  };
}
