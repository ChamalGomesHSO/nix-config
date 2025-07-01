{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # Docker ecosystem
    docker
    docker-compose
    
    # CI/CD tools
    gh
    actionlint
    
    # Development tools
    just
    git
    curl
    jq
  ];
}
