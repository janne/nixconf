{ pkgs, ... }: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    extraConfig = ''
      set tabstop=2
      set softtabstop=2
      set shiftwidth=2
      set autoindent
      set number
      set expandtab
      set incsearch
      set linebreak
    '';
    plugins = with pkgs.vimPlugins; [ vim-surround nerdtree ];
  };
}
