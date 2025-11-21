{
  config,
  lib,
  pkgs,
  ...
}:

{
  options = {
    browsers.google-chrome.enable = lib.mkEnableOption "Enables Google Chrome";
  };

  config = lib.mkIf config.browsers.google-chrome.enable {
    programs.google-chrome = {
      enable = true;
    };

    xdg.mimeApps = {
      defaultApplications = {
        "text/html" = [ "google-chrome.desktop" ];
        "application/xhtml+xml" = [ "google-chrome.desktop" ];
        "x-scheme-handler/http" = [ "google-chrome.desktop" ];
        "x-scheme-handler/https" = [ "google-chrome.desktop" ];
        "x-scheme-handler/ftp" = [ "google-chrome.desktop" ];
        "application/pdf" = [ "google-chrome.desktop" ];
      };
    };

    home.sessionVariables.DEFAULT_BROWSER = "${pkgs.google-chrome}/bin/google-chrome";
  };
}
