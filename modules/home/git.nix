{ config, pkgs, ... }:
{
  home.shellAliases = {
    g = "git";
    lg = "lazygit";
  };
  
  home.packages = with pkgs; [
    git-lfs
    git-credential-manager
  ];

  # https://nixos.asia/en/git
  programs = {
    git = {
      enable = true;
      lfs.enable = true;
      package = pkgs.gitFull;
      ignores = [ "*~" "*.swp" ];
      settings = {
        user = {
          name = config.me.fullname;
          email = config.me.email;
        };
        alias = {
          ci = "commit";
        };
        init.defaultBranch = "main";
        pull.rebase = "true";
      };
    };
    lazygit.enable = true;
  };
}
