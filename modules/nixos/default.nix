# Configuration common to all Linux systems
{
  flake,
  pkgs,
  ...
}:

let
  inherit (flake) inputs;
  inherit (inputs) self;
in
{
  imports = [
    {
      home-manager.sharedModules = [
        inputs.nix-index.homeManagerModules.${pkgs.system}.default
        self.homeModules.default
        inputs.arkenfox-nixos.hmModules.arkenfox
      ];
    }
    self.nixosModules.common
    self.nixosModules.gaming
  ];
}
