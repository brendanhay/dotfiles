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
      packages = with pkgs; [
        fira-code
        fira-code-symbols
        font-awesome
        jetbrains-mono
        noto-fonts
        noto-fonts-cjk
        noto-fonts-emoji
        siji
        sorts-mill-goudy
        nerdfonts
      ];

      enableDefaultPackages = false;

      fontconfig.defaultFonts = {
        serif = [ "Noto Serif" ];
        sansSerif = [ "Fira Sans" ];
        monospace = [ "Essential PragmataPro" "JetBrains Mono ExtraLight" "Fira Code" ];
        emoji = [ "Noto Color Emoji" ];
      };
    };

    modules.home-manager.fonts.fontconfig.enable = true;
  };
}
