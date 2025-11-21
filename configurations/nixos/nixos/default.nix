# See /modules/nixos/* for actual settings
# This file is just *top-level* configuration.
{ flake, ... }:

let
  inherit (flake) inputs;
  inherit (inputs) self;
in
{
  imports = [
    self.nixosModules.default
    self.nixosModules.gui
    ./configuration.nix
  ];

  gaming = {
    steam.enable = true;
    lutris.enable = true;
    heroic.enable = true;
  };

  hardware.opentabletdriver.enable = true;
  hardware.uinput.enable = true;
  boot.kernelModules = [ "uinput" ];

  # Workaround the annoying `Failed to start Network Manager Wait Online` error on switch.
  # https://github.com/NixOS/nixpkgs/issues/180175
  systemd.services.NetworkManager-wait-online.enable = false;
}
