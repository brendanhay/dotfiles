{ config, pkgs, lib, ... }:

with lib;

let
  cfg = config.modules.mime;

  emacsclient = pkgs.makeDesktopItem {
    name = "emacs";
    desktopName = "Emacs Client (no wait)";
    exec = "emacsclient -nc %f";
    terminal = "false";
  };
in
{
  options.modules.mime = {
    enable = mkOption {
      type = types.bool;
      default = false;
    };

    viewer = {
      audio = mkOption {
        type = types.str;
        default = "org.gnome.Lollypop.desktop";
      };

      images = mkOption {
        type = types.str;
        default = "feh.desktop";
      };

      text = mkOption {
        type = types.str;
        default = "emacs.desktop"; # emacsclient; # "emacsclient.desktop";
      };

      browser = mkOption {
        type = types.str;
        default = "firefox.desktop";
      };
    };
  };

  config = mkIf cfg.enable {
    # XXX: move somewhere sensible.
    modules.home-manager.programs.feh.enable = true;

    modules.home-manager.xdg = {
      mime.enable = true;
      mimeApps = {
        enable = true;
        defaultApplications = {
          "application/ogg" = cfg.viewer.audio;
          "application/vnd.apple.mpegurl" = cfg.viewer.audio;
          "application/x-ogg" = cfg.viewer.audio;
          "application/x-ogm-audio" = cfg.viewer.audio;
          "application/xspf+xml" = cfg.viewer.audio;
          "audio/aac" = cfg.viewer.audio;
          "audio/ac3" = cfg.viewer.audio;
          "audio/flac" = cfg.viewer.audio;
          "audio/m4a" = cfg.viewer.audio;
          "audio/mp3" = cfg.viewer.audio;
          "audio/mp4" = cfg.viewer.audio;
          "audio/mpeg" = cfg.viewer.audio;
          "audio/mpegurl" = cfg.viewer.audio;
          "audio/ogg" = cfg.viewer.audio;
          "audio/vnd.rn-realaudio" = cfg.viewer.audio;
          "audio/vorbis" = cfg.viewer.audio;
          "audio/x-aac" = cfg.viewer.audio;
          "audio/x-flac" = cfg.viewer.audio;
          "audio/x-m4a" = cfg.viewer.audio;
          "audio/x-mp3" = cfg.viewer.audio;
          "audio/x-mpeg" = cfg.viewer.audio;
          "audio/x-mpegurl" = cfg.viewer.audio;
          "audio/x-ms-wma" = cfg.viewer.audio;
          "audio/x-musepack" = cfg.viewer.audio;
          "audio/x-oggflac" = cfg.viewer.audio;
          "audio/x-opus+ogg" = cfg.viewer.audio;
          "audio/x-pn-realaudio" = cfg.viewer.audio;
          "audio/x-scpls" = cfg.viewer.audio;
          "audio/x-speex" = cfg.viewer.audio;
          "audio/x-vorbis" = cfg.viewer.audio;
          "audio/x-vorbis+ogg" = cfg.viewer.audio;
          "audio/x-wav" = cfg.viewer.audio;
          "x-content/audio-player" = cfg.viewer.audio;

          "image/bmp" = cfg.viewer.images;
          "image/g3fax" = cfg.viewer.images;
          "image/gif" = cfg.viewer.images;
          "image/x-fits" = cfg.viewer.images;
          "image/x-pcx" = cfg.viewer.images;
          "image/x-portable-anymap" = cfg.viewer.images;
          "image/x-portable-bitmap" = cfg.viewer.images;
          "image/x-portable-graymap" = cfg.viewer.images;
          "image/x-portable-pixmap" = cfg.viewer.images;
          "image/x-psd" = cfg.viewer.images;
          "image/x-sgi" = cfg.viewer.images;
          "image/x-tga" = cfg.viewer.images;
          "image/x-xbitmap" = cfg.viewer.images;
          "image/x-xwindowdump" = cfg.viewer.images;
          "image/x-xcf" = cfg.viewer.images;
          "image/x-compressed-xcf" = cfg.viewer.images;
          "image/tiff" = cfg.viewer.images;
          "image/jpeg" = cfg.viewer.images;
          "image/x-psp" = cfg.viewer.images;
          "application/postscript" = cfg.viewer.images;
          "image/png" = cfg.viewer.images;
          "image/x-icon" = cfg.viewer.images;
          "image/x-xpixmap" = cfg.viewer.images;
          "image/x-exr" = cfg.viewer.images;
          "image/x-webp" = cfg.viewer.images;
          "image/heif" = cfg.viewer.images;
          "image/heic" = cfg.viewer.images;
          "image/svg+xml" = cfg.viewer.images;
          "application/pdf" = cfg.viewer.images;
          "image/x-wmf" = cfg.viewer.images;
          "image/jp2" = cfg.viewer.images;
          "image/x-xcursor" = cfg.viewer.images;

          "application/rtf" = cfg.viewer.text;
          "application/vnd.mozilla.xul+xml" = cfg.viewer.text;
          "application/xhtml+xml" = cfg.viewer.text;
          "application/xml" = cfg.viewer.text;
          "application/x-shellscript" = cfg.viewer.text;
          "application/x-wine-extension-ini" = cfg.viewer.text;
          "application/zip" = cfg.viewer.text;
          "text/english" = cfg.viewer.text;
          "text/html" = cfg.viewer.text;
          "text/markdown" = cfg.viewer.text;
          "text/plain" = cfg.viewer.text;
          "text/x-log" = cfg.viewer.text;
          "text/x-makefile" = cfg.viewer.text;
          "text/x-c++hdr" = cfg.viewer.text;
          "text/x-c++src" = cfg.viewer.text;
          "text/x-chdr" = cfg.viewer.text;
          "text/x-csrc" = cfg.viewer.text;
          "text/x-java" = cfg.viewer.text;
          "text/x-moc" = cfg.viewer.text;
          "text/x-pascal" = cfg.viewer.text;
          "text/x-tcl" = cfg.viewer.text;
          "text/x-tex" = cfg.viewer.text;
          "text/xml" = cfg.viewer.text;
          "text/x-c" = cfg.viewer.text;
          "text/x-c++" = cfg.viewer.text;

          "x-scheme-handler/http" = cfg.viewer.browser;
          "x-scheme-handler/https" = cfg.viewer.browser;
          "x-scheme-handler/mailto" = cfg.viewer.browser;
          "x-scheme-handler/unknown" = cfg.viewer.browser;
          "x-scheme-handler/webcal" = cfg.viewer.browser;
          "message/rfc822" = cfg.viewer.browser;
        };
      };
    };
  };
}
