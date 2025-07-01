{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    # autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = ["git" "python" "docker" "github"];
      theme = "robbyrussell";
    };
    shellAliases = {
      ll = "ls -la";
      update = "home-manager switch";
      docker-clean = "docker system prune -af";
    };
  };
}
