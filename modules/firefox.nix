{ config, pkgs, lib, ... }:

with lib;

let
  cfg = config.modules.firefox;
in
{
  options.modules.firefox = {
    enable = mkOption {
      type = types.bool;
      default = false;
    };
  };

  config = mkIf cfg.enable {
    modules.home-manager.programs.firefox = {
      enable = true;
      profiles.${config.modules.user.name} = {
        extensions = with pkgs.nur.repos.rycee.firefox-addons; [
          bitwarden
          clearurls
          libredirect
          no-pdf-download
          privacy-badger
          translate-web-pages
          ublock-origin
        ];

        settings = {
          # Performance
          "gfx.webrender.all" = true;
          "media.ffmpeg.vaapi.enabled" = true;
          "widget.dmabuf.force-enabled" = true;

          # Hide "sharing indicator" for tiling WMs on wayland
          "privacy.webrtc.legacyGlobalIndicator" = false;

          # Set dark theme by default.
          "browser.in-content.dark-mode" = true;

          # New Tab
          "browser.newtabpage.activity-stream.feeds.snippets" = false;
          "browser.newtabpage.activity-stream.showSponsored" = false;
          "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;

          # Extensions
          "extensions.getAddons.showPane" = false;
          "extensions.htmlaboutaddons.recommendations.enabled" = false;

          # Privacy
          "datareporting.policy.dataSubmissionEnable" = false;
          "datareporting.policy.dataSubmissionPolicyAcceptedVersion" = 2;
          "privacy.trackingprotection.enabled" = true;
          "privacy.trackingprotection.socialtracking.enabled" = true;
        };
      };
    };
  };
}
