{ config, pkgs, lib, ... }:

{
  imports = [
    ./modules/options.nix
    ./modules/packages.nix
    ./modules/git.nix
    ./modules/bash.nix
    ./modules/vim.nix
    ./modules/zsh.nix
    ./modules/docker.nix
  ];

  my.home.azureUserDir = "/home/azureuser/cloudfiles/code/Users/Chamal.Gomes";
  my.home.trustedGitDirs = [
    "/home/azureuser/cloudfiles/code/Users/Chamal.Gomes/*"
    "/mnt/batch/tasks/shared/LS_root/mounts/clusters/cg1/code/Users/Chamal.Gomes/nix-config"
  ];

  # Let Home Manager manage itself
  programs.home-manager.enable = true;

  home.username = "azureuser";
  home.homeDirectory = "/home/azureuser";

  # Required for migration tracking
  home.stateVersion = "23.11";
}
