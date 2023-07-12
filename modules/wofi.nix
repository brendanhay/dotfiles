{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.modules.wofi;
in
{
  options.modules.wofi = {
    enable = mkOption {
      type = types.bool;
      default = false;
    };
  };

  config = mkIf cfg.enable {
    modules.home-manager.programs.wofi = {
      enable = true;
      settings = {
        location = "bottom-right";
        style = ''
          * {
            font-family: monospace;
          }

          window {
            margin: 5px;
            border: 2px solid red;
            background-color: red;
          }

          #input {
            margin: 5px;
            border: 2px solid blue;
            background-color: blue;
          }

          #inner-box {
            margin: 5px;
            border: 2px solid yellow;
            background-color: yellow;
          }

          #outer-box {
            margin: 5px;
            border: 2px solid green;
            background-color: green;
          }

          #scroll {
            margin: 5px;
            border: 2px solid orange;
            background-color: orange;
          }

          #text {
            margin: 5px;
            border: 2px solid cyan;
            background-color: cyan;
          }
        ''
          };
      };
    };
  }
