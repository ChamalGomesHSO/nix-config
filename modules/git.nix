{ config, pkgs, ... }:

# Access the variable from `config.my.home.trustedGitDirs`
let
  gitSafeDirs = config.my.home.trustedGitDirs or [];
in
{
  programs.git = {
    enable = true;
    userName = "ChamalGomesHSO";
    userEmail = "chamalgomes166@gmail.com";

    extraConfig = {
      safe.directory = gitSafeDirs;
      core = {
        editor = "vim";
        whitespace = "fix,-indent-with-non-tab,trailing-space,cr-at-eol";
      };
      color.ui = "auto";
      pull.rebase = false;
      push.default = "simple";
    };

    aliases = {
      st = "status";
      co = "checkout";
      ci = "commit";
      br = "branch";
      df = "diff";
      lg = "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'";
      amend = "commit --amend --reuse-message=HEAD";
      undo = "reset HEAD~1 --mixed";
    };
  };
}
