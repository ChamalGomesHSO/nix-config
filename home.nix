{ config, pkgs, lib, ... }:

{
  imports = [
    ./modules/packages.nix
    ./modules/git.nix
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
