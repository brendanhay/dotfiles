{ config, pkgs, lib, ... }:

with lib;

let
  cfg = config.modules.fonts;
in
{
  options.modules.fonts = {
    enable = mkOption {
      type = types.bool;
      default = false;
    };
  };

  config = {
    fonts = mkIf cfg.enable {
      fonts = with pkgs; [
        fira-code
        fira-code-symbols
        font-awesome
        jetbrains-mono
        noto-fonts
        siji
      ];

      enableDefaultFonts = false;

      fontconfig.defaultFonts = {
        serif = [ "Noto Serif" ];
        sansSerif = [ "Fira Sans" ];
        monospace = [ "JetBrains Mono ExtraLight" "Essential PragmataPro" "Fira Code" ];
        emoji = [ "Noto Color Emoji" ];
      };
    };

    modules.home-manager.fonts.fontconfig.enable = true;
  };
}
