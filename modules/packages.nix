{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # Python ecosystem
    python312
    python312Packages.uv

    # Docker ecosystem
    docker
    docker-compose
    
    # CI/CD tools
    gh  # GitHub CLI
    
    # Development tools
    just  # Keep Just for simpler tasks
    git
    curl
    jq
  ];
}
