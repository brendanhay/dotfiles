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

          # Hide "sharing indicator" for tiling WMs on wayland.
          "privacy.webrtc.legacyGlobalIndicator" = false;

          # Disable built-in password manager.
          "signon.rememberSignons" = false;


          # Set dark theme by default.
          "devtools.theme" = "dark";
          "browser.in-content.dark-mode" = true;

          # New Tab
          "browser.newtab.url" = "about:blank";
          "browser.newtabpage.enabled" = false;
          "browser.newtabpage.activity-stream.enabled" = false;
          "browser.newtabpage.activity-stream.telemetry" = false;
          "browser.newtabpage.enhanced" = false;
          "browser.newtabpage.introShown" = true;
          "browser.newtab.preload" = false;
          "browser.newtabpage.directory.ping" = "";
          "browser.newtabpage.directory.source" = "data:text/plain,{}";

          # "New to Firefox? Let's get started!" tour.
          "browser.onboarding.enabled" = false;

          # Reduce search engine noise in the urlbar's completion window.
          "browser.urlbar.suggest.searches" = false;
          "browser.urlbar.shortcuts.bookmarks" = false;
          "browser.urlbar.shortcuts.history" = false;
          "browser.urlbar.shortcuts.tabs" = false;
          "browser.urlbar.showSearchSuggestionsFirst" = false;
          "browser.urlbar.speculativeConnect.enabled" = false;
          # https://bugzilla.mozilla.org/1642623
          "browser.urlbar.dnsResolveSingleWordsAfterSearch" = 0;
          # https://blog.mozilla.org/data/2021/09/15/data-and-firefox-suggest/
          "browser.urlbar.suggest.quicksuggest.nonsponsored" = false;
          "browser.urlbar.suggest.quicksuggest.sponsored" = false;

          # Security-oriented defaults.
          "security.family_safety.mode" = 0;

          # Uses Google Analytics.
          "extensions.getAddons.showPane" = false;

          "extensions.htmlaboutaddons.recommendations.enabled" = false;

          # Disable telemetry
          "toolkit.telemetry.unified" = false;
          "toolkit.telemetry.enabled" = false;
          "toolkit.telemetry.server" = "data:,";
          "toolkit.telemetry.archive.enabled" = false;
          "toolkit.telemetry.coverage.opt-out" = true;
          "toolkit.coverage.opt-out" = true;
          "toolkit.coverage.endpoint.base" = "";
          # https://mozilla.github.io/normandy/
          "app.normandy.enabled" = false;
          "app.normandy.api_url" = "";
          "app.shield.optoutstudies.enabled" = false;
          # Disable health reports.
          "datareporting.healthreport.uploadEnabled" = false;
          "datareporting.healthreport.service.enabled" = false;
          "datareporting.policy.dataSubmissionEnabled" = false;

          # Disable crash reports.
          "breakpad.reportURL" = "";
          "browser.tabs.crashReporting.sendReport" = false;
          "browser.crashReports.unsubmittedCheck.autoSubmit2" = false;

          # Privacy
          "datareporting.policy.dataSubmissionEnable" = false;
          "datareporting.policy.dataSubmissionPolicyAcceptedVersion" = 2;
          "privacy.trackingprotection.enabled" = true;
          "privacy.trackingprotection.socialtracking.enabled" = true;
          "privacy.donottrackheader.enabled" = true;
          "privacy.donottrackheader.value" = 1;
          "privacy.purge_trackers.enabled" = true;
        };
      };
    };
  };
}
