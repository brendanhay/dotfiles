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
        jetbrains-mono
        (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
        noto-fonts
      ];

      enableDefaultFonts = false;

      fontconfig.defaultFonts = {
        serif = [ "Noto Serif" "Noto Color Emoji" ];
        sansSerif = [ "Noto Sans" "Noto Color Emoji" ];
        monospace = [ "Essential PragmataPro" "JetBrains Mono ExtraLight" "Noto Color Emoji" ];
        emoji = [ "Noto Color Emoji" ];
      };
    };

    modules.home-manager.fonts.fontconfig.enable = true;
  };
}
