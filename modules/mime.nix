{ ... }:

let
  audioApp = "org.gnome.Lollypop.desktop";

  audioDefaults = {
    "application/ogg" = "org.gnome.Lollypop.desktop";
    "application/vnd.apple.mpegurl" = "org.gnome.Lollypop.desktop";
    "application/x-ogg" = "org.gnome.Lollypop.desktop";
    "application/x-ogm-audio" = "org.gnome.Lollypop.desktop";
    "application/xspf+xml" = "org.gnome.Lollypop.desktop";
    "audio/aac" = "org.gnome.Lollypop.desktop";
    "audio/ac3" = "org.gnome.Lollypop.desktop";
    "audio/flac" = "org.gnome.Lollypop.desktop";
    "audio/m4a" = "org.gnome.Lollypop.desktop";
    "audio/mp3" = "org.gnome.Lollypop.desktop";
    "audio/mp4" = "org.gnome.Lollypop.desktop";
    "audio/mpeg" = "org.gnome.Lollypop.desktop";
    "audio/mpegurl" = "org.gnome.Lollypop.desktop";
    "audio/ogg" = "org.gnome.Lollypop.desktop";
    "audio/vnd.rn-realaudio" = "org.gnome.Lollypop.desktop";
    "audio/vorbis" = "org.gnome.Lollypop.desktop";
    "audio/x-aac" = "org.gnome.Lollypop.desktop";
    "audio/x-flac" = "org.gnome.Lollypop.desktop";
    "audio/x-m4a" = "org.gnome.Lollypop.desktop";
    "audio/x-mp3" = "org.gnome.Lollypop.desktop";
    "audio/x-mpeg" = "org.gnome.Lollypop.desktop";
    "audio/x-mpegurl" = "org.gnome.Lollypop.desktop";
    "audio/x-ms-wma" = "org.gnome.Lollypop.desktop";
    "audio/x-musepack" = "org.gnome.Lollypop.desktop";
    "audio/x-oggflac" = "org.gnome.Lollypop.desktop";
    "audio/x-opus+ogg" = "org.gnome.Lollypop.desktop";
    "audio/x-pn-realaudio" = "org.gnome.Lollypop.desktop";
    "audio/x-scpls" = "org.gnome.Lollypop.desktop";
    "audio/x-speex" = "org.gnome.Lollypop.desktop";
    "audio/x-vorbis" = "org.gnome.Lollypop.desktop";
    "audio/x-vorbis+ogg" = "org.gnome.Lollypop.desktop";
    "audio/x-wav" = "org.gnome.Lollypop.desktop";
    "x-content/audio-player" = "org.gnome.Lollypop.desktop";
  };
  chatDefaults = {
    "x-scheme-handler/mailto" = "thunderbird.desktop";
    "message/rfc822" = "thunderbird.desktop";
  };
  documentDefaults = {
    "application/vnd.comicbook-rar" = "org.gnome.Evince.desktop";
    "application/vnd.comicbook+zip" = "org.gnome.Evince.desktop";
    "application/x-cb7" = "org.gnome.Evince.desktop";
    "application/x-cbr" = "org.gnome.Evince.desktop";
    "application/x-cbt" = "org.gnome.Evince.desktop";
    "application/x-cbz" = "org.gnome.Evince.desktop";
    "application/x-ext-cb7" = "org.gnome.Evince.desktop";
    "application/x-ext-cbr" = "org.gnome.Evince.desktop";
    "application/x-ext-cbt" = "org.gnome.Evince.desktop";
    "application/x-ext-cbz" = "org.gnome.Evince.desktop";
    "application/x-ext-djv" = "org.gnome.Evince.desktop";
    "application/x-ext-djvu" = "org.gnome.Evince.desktop";
    "image/vnd.djvu+multipage" = "org.gnome.Evince.desktop";
    "application/x-bzdvi" = "org.gnome.Evince.desktop";
    "application/x-dvi" = "org.gnome.Evince.desktop";
    "application/x-ext-dvi" = "org.gnome.Evince.desktop";
    "application/x-gzdvi" = "org.gnome.Evince.desktop";
    "application/pdf" = "org.gnome.Evince.desktop";
    "application/x-bzpdf" = "org.gnome.Evince.desktop";
    "application/x-ext-pdf" = "org.gnome.Evince.desktop";
    "application/x-gzpdf" = "org.gnome.Evince.desktop";
    "application/x-xzpdf" = "org.gnome.Evince.desktop";
    "application/postscript" = "org.gnome.Evince.desktop";
    "application/x-bzpostscript" = "org.gnome.Evince.desktop";
    "application/x-gzpostscript" = "org.gnome.Evince.desktop";
    "application/x-ext-eps" = "org.gnome.Evince.desktop";
    "application/x-ext-ps" = "org.gnome.Evince.desktop";
    "image/x-bzeps" = "org.gnome.Evince.desktop";
    "image/x-eps" = "org.gnome.Evince.desktop";
    "image/x-gzeps" = "org.gnome.Evince.desktop";
    "image/tiff" = "org.gnome.Evince.desktop";
    "application/oxps" = "org.gnome.Evince.desktop";
    "application/vnd.ms-xpsdocument" = "org.gnome.Evince.desktop";
    "application/illustrator" = "org.gnome.Evince.desktop";
  };
  imageDefaults = {
    "image/gif" = "org.gnome.Shotwell-Viewer.desktop";
    "image/jpeg" = "org.gnome.Shotwell-Viewer.desktop";
    "image/jpg" = "org.gnome.Shotwell-Viewer.desktop";
    "image/pjpeg" = "org.gnome.Shotwell-Viewer.desktop";
    "image/png" = "org.gnome.Shotwell-Viewer.desktop";
    "image/tiff" = "org.gnome.Shotwell-Viewer.desktop";
    "image/webp" = "org.gnome.Shotwell-Viewer.desktop";
    "image/x-3fr" = "org.gnome.Shotwell-Viewer.desktop";
    "image/x-adobe-dng" = "org.gnome.Shotwell-Viewer.desktop";
    "image/x-arw" = "org.gnome.Shotwell-Viewer.desktop";
    "image/x-bay" = "org.gnome.Shotwell-Viewer.desktop";
    "image/x-bmp" = "org.gnome.Shotwell-Viewer.desktop";
    "image/x-canon-cr2" = "org.gnome.Shotwell-Viewer.desktop";
    "image/x-canon-crw" = "org.gnome.Shotwell-Viewer.desktop";
    "image/x-cap" = "org.gnome.Shotwell-Viewer.desktop";
    "image/x-cr2" = "org.gnome.Shotwell-Viewer.desktop";
    "image/x-crw" = "org.gnome.Shotwell-Viewer.desktop";
    "image/x-dcr" = "org.gnome.Shotwell-Viewer.desktop";
    "image/x-dcraw" = "org.gnome.Shotwell-Viewer.desktop";
    "image/x-dcs" = "org.gnome.Shotwell-Viewer.desktop";
    "image/x-dng" = "org.gnome.Shotwell-Viewer.desktop";
    "image/x-drf" = "org.gnome.Shotwell-Viewer.desktop";
    "image/x-eip" = "org.gnome.Shotwell-Viewer.desktop";
    "image/x-erf" = "org.gnome.Shotwell-Viewer.desktop";
    "image/x-fff" = "org.gnome.Shotwell-Viewer.desktop";
    "image/x-fuji-raf" = "org.gnome.Shotwell-Viewer.desktop";
    "image/x-iiq" = "org.gnome.Shotwell-Viewer.desktop";
    "image/x-k25" = "org.gnome.Shotwell-Viewer.desktop";
    "image/x-kdc" = "org.gnome.Shotwell-Viewer.desktop";
    "image/x-mef" = "org.gnome.Shotwell-Viewer.desktop";
    "image/x-minolta-mrw" = "org.gnome.Shotwell-Viewer.desktop";
    "image/x-mos" = "org.gnome.Shotwell-Viewer.desktop";
    "image/x-mrw" = "org.gnome.Shotwell-Viewer.desktop";
    "image/x-nef" = "org.gnome.Shotwell-Viewer.desktop";
    "image/x-nikon-nef" = "org.gnome.Shotwell-Viewer.desktop";
    "image/x-nrw" = "org.gnome.Shotwell-Viewer.desktop";
    "image/x-olympus-orf" = "org.gnome.Shotwell-Viewer.desktop";
    "image/x-orf" = "org.gnome.Shotwell-Viewer.desktop";
    "image/x-panasonic-raw" = "org.gnome.Shotwell-Viewer.desktop";
    "image/x-pef" = "org.gnome.Shotwell-Viewer.desktop";
    "image/x-pentax-pef" = "org.gnome.Shotwell-Viewer.desktop";
    "image/x-png" = "org.gnome.Shotwell-Viewer.desktop";
    "image/x-ptx" = "org.gnome.Shotwell-Viewer.desktop";
    "image/x-pxn" = "org.gnome.Shotwell-Viewer.desktop";
    "image/x-r3d" = "org.gnome.Shotwell-Viewer.desktop";
    "image/x-raf" = "org.gnome.Shotwell-Viewer.desktop";
    "image/x-raw" = "org.gnome.Shotwell-Viewer.desktop";
    "image/x-rw2" = "org.gnome.Shotwell-Viewer.desktop";
    "image/x-rwl" = "org.gnome.Shotwell-Viewer.desktop";
    "image/x-rwz" = "org.gnome.Shotwell-Viewer.desktop";
    "image/x-sigma-x3f" = "org.gnome.Shotwell-Viewer.desktop";
    "image/x-sony-arw" = "org.gnome.Shotwell-Viewer.desktop";
    "image/x-sony-sr2" = "org.gnome.Shotwell-Viewer.desktop";
    "image/x-sony-srf" = "org.gnome.Shotwell-Viewer.desktop";
    "image/x-sr2" = "org.gnome.Shotwell-Viewer.desktop";
    "image/x-srf" = "org.gnome.Shotwell-Viewer.desktop";
    "image/x-x3f" = "org.gnome.Shotwell-Viewer.desktop";
  };
in
{
  xdg.mimeApps.defaultApplications =
    audioDefaults
    // chatDefaults
    // documentDefaults
    // imageDefaults;
}
