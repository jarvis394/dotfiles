{ config, pkgs, lib, ... }:

{
  options = {
    code-editors.vscode.enable = lib.mkEnableOption "VSCode with default extensions";
  };
  
  config = {
    home.file.".config/Code/User/settings.json".source = lib.mkDefault ./settings.json;
    home.file.".config/Code/User/keybindings.json".source = lib.mkDefault ./keybindings.json;
  };
}
