{
  config,
  pkgs,
  lib,
  ...
}:

{
  options.games.osu-lazer.enable = lib.mkEnableOption "osu!lazer";

  config = lib.mkIf config.games.osu-lazer.enable {
    home.packages = with pkgs; [
      osu-lazer-bin
    ];
  };
}
