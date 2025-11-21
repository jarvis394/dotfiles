{
  flake,
  pkgs,
  lib,
  ...
}:
let
  inherit (flake) inputs;
  inherit (inputs) self;
  inherit (pkgs.stdenv) isDarwin;
  inherit (self.settings) adminUser;
in
{
  nix = {
    nixPath = [ "nixpkgs=${flake.inputs.nixpkgs}" ]; # Enables use of `nix-shell -p ...` etc
    registry.nixpkgs.flake = flake.inputs.nixpkgs; # Make `nix shell` etc use pinned nixpkgs
    settings = {
      max-jobs = "auto";
      experimental-features = "nix-command flakes";
      # Nullify the registry for purity.
      flake-registry = builtins.toFile "empty-flake-registry.json" ''{"flakes":[],"version":2}'';
      trusted-users = [
        "root"
        (if isDarwin then adminUser else "@wheel")
      ];
      # To allow building on rosetta
      extra-platforms = lib.mkIf isDarwin "aarch64-darwin x86_64-darwin";
    };

    # When disk space goes low (100GB left), run garbage collection until 1TB is free.
    # https://nixos.wiki/wiki/Storage_optimization#Automatic
    extraOptions = ''
      min-free = ${toString (100 * 1024 * 1024 * 1024)}
      max-free = ${toString (1024 * 1024 * 1024 * 1024)}
    '';
  };

  nixpkgs = {
    config.allowUnfree = true;
    config.allowBroken = true;

    # Overlays
    overlays = [
      inputs.nur.overlays.default
      inputs.vscode-extensions.overlays.default
    ];
  };

  services.openssh.enable = true;
}
