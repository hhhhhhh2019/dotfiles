{ inputs, self, ... }: {
  flake.nixosModules.default-environment = { pkgs, ... }: {
    programs.zsh = {
      enable = true;
      syntaxHighlighting.enable = true;
      promptInit = "";
      interactiveShellInit = ''
        source ${pkgs.grml-zsh-config}/etc/zsh/zshrc
      '';
    };

    programs.vim = {
      enable = true;
      defaultEditor = true;
      package = (pkgs.vim.override {}).customize {
        name = "vim";
        vimrcConfig.customRC = ''
          syntax on
          set autoindent
          set smartindent
          set smartcase
          set mouse=a
          set expandtab
          set tabstop=2
          set shiftwidth=2
          filetype plugin indent on
        '';
      };
    };

    programs.tmux = {
      enable = true;
    };

    programs.git = {
      enable = true;
    };
  };
}
