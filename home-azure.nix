{ config, pkgs, lib, ... }:

let
  azureUserDir = "/home/azureuser/cloudfiles/code/Users/Chamal.Homes";
  trustedGitDirs = [
    "${azureUserDir}"
  ];
in
{
  imports = [
    ./modules/packages.nix
    (import ./modules/git.nix { inherit trustedGitDirs; })
    (import ./modules/bash.nix { inherit azureUserDir; })
    ./modules/vim.nix
    ./modules/zsh.nix
    ./modules/docker.nix
  ];

  # Let Home Manager manage itself
  programs.home-manager.enable = true;

  home.username = "azureuser";
  home.homeDirectory = "/home/azureuser";

  # Required for migration tracking
  home.stateVersion = "23.11";
}
