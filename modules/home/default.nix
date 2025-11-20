{ config, lib, pkgs, ... }:
{
  imports = [
    ./code-editors
    ./browsers
    ./direnv.nix
    ./git.nix
    ./nix-index.nix
    ./packages.nix
    ./gc.nix
    ./me.nix
    ./nix.nix
    ./shell.nix
  ];
}
