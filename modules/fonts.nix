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
        # serif = [ "Noto Serif" "Noto Color Emoji" ];
        sansSerif = [ "Fira Sans" ];
        # sansSerif = [ "Noto Sans" "Noto Color Emoji" ];
        #        monospace = [ "Essential PragmataPro" "JetBrains Mono ExtraLight" "Noto Color Emoji" ];
        monospace = [ "Fira Code" "JetBrains Mono ExtraLight" ];
        emoji = [ "Noto Color Emoji" ];
      };
    };

    modules.home-manager.fonts.fontconfig.enable = true;
  };
}
