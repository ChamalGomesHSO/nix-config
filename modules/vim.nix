{ config, pkgs, ... }:

{
  programs.vim = {
    enable = true;
    settings = {
      number = true;
      relativenumber = true;
      expandtab = true;
      shiftwidth = 4;
      tabstop = 4;
    };

    plugins = with pkgs.vimPlugins; [
      vim-just
    ];

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
}
