# Platform-independent terminal setup
{ flake, pkgs, ... }:

let
  inherit (flake) inputs;
in
{
  programs = {
    # Command not found handler based on nixpkgs
    nix-index-fork = {
      enable = true;
      enableZshIntegration = true;
      enableNixCommand = true;
      package = inputs.nix-index.packages.${pkgs.system}.default;
      database = inputs.nix-index-database.packages.${pkgs.system}.nix-index-small-database;
    };
    command-not-found.enable = false;
  };
}
