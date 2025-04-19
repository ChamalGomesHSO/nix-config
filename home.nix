{ config, pkgs, lib, ... }:

{
  # Let Home Manager manage itself
  programs.home-manager.enable = true;

  # Basic info
  home.username = "chamalgomes";
  home.homeDirectory = "/home/chamalgomes";
  
  # Python & Data Science Tools
  home.packages = with pkgs; [
    # Python ecosystem
    python312
    python312Packages.uv
    python312Packages.ipython
    python312Packages.jupyter
    python312Packages.jupyterlab
    python312Packages.numpy
    python312Packages.pandas
    
    # Docker ecosystem
    docker
    docker-compose
    
    # CI/CD tools
    gh  # GitHub CLI
    
    # Development tools
    just  # Keep Just for simpler tasks
    git
    vim
    curl
    jq
  ];
  
  # Git Configuration
  programs.git = {
    enable = true;
    userName = "ChamalGomesHSO";
    userEmail = "chamalgomes166@gmail.com";
    
    extraConfig = {
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
  
  # Vim Configuration
  programs.vim = {
    enable = true;
    settings = {
      number = true;
      relativenumber = true;
      expandtab = true;
      shiftwidth = 4;
      tabstop = 4;
    };
    extraConfig = ''
      " Basic Settings
      set encoding=utf-8
      set ruler
      set wildmenu
      set showmatch
      set incsearch
      set hlsearch
      set ignorecase
      set smartcase
      
      " Key remappings
      let mapleader = ","
      inoremap jk <Esc>
      
      " Python specific settings
      autocmd FileType python setlocal shiftwidth=4 softtabstop=4 expandtab
      
      " Status line
      set laststatus=2
      set statusline=%f               " Path to the file
      set statusline+=%=              " Switch to the right side
      set statusline+=%l,%c           " Line, column
      set statusline+=\ %P            " Percentage through file
    '';
  };
  
  # Shell configuration (Bash)
  programs.bash = {
    enable = true;
    shellAliases = {
      ll = "ls -la";
      update = "home-manager switch";
      docker-clean = "docker system prune -af";
    };
    initExtra = ''
      # Python virtual environment helper
      venv() {
        if [ -d venv ]; then
          source venv/bin/activate
        else
          python -m venv venv
          source venv/bin/activate
          pip install --upgrade pip
        fi
      }
      
      # GitHub Actions local runner
      run-action() {
        act -j "$1"
      }
    '';
  };
  
  # Shell configuration
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;
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
  
  # Docker configuration
  home.file.".docker/config.json".text = ''
    {
      "experimental": "enabled",
      "psFormat": "table {{.ID}}\\t{{.Image}}\\t{{.Status}}\\t{{.Names}}"
    }
  '';
  
  # Don't change this value
  home.stateVersion = "23.11";
}
