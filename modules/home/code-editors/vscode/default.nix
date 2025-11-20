{ config, pkgs, lib, ... }:

{
  options = {
    code-editors.vscode.enable = lib.mkEnableOption "VSCode with default extensions";
  };
  
  config = lib.mkIf config.code-editors.vscode.enable {
    programs.vscode = {
      enable = true;
      package = pkgs.vscode;
    };

    home.file.".config/Code/User/settings.json".source = lib.mkDefault ./settings.json;
    home.file.".config/Code/User/keybindings.json".source = lib.mkDefault ./keybindings.json;
  };
}
