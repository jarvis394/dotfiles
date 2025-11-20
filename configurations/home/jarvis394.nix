{ flake, pkgs, ... }:
let
  inherit (flake) inputs;
  inherit (inputs) self;
in
{
  imports = [
    self.homeModules.default
  ];

  # Defined by /modules/home/me.nix
  # And used all around in /modules/home/*
  me = {
    username = "jarvis394";
    fullname = "Vladislav Ekushev";
    email = "tarnatovski@gmail.com";
  };

  home.packages = with pkgs; [
    discord
    telegram-desktop
  ];

  browsers = {
    chromium.enable = true;
    #firefox.enable = true;
  };

  code-editors = {
    vscode.enable = true;
  };

  home.stateVersion = "25.11";
}
