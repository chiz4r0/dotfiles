{
  pkgs,
  lib,
  ...
}: {
  programs.nvf.settings.vim = {
    telescope = {
      enable = true;

      extensions = [
        {
          name = "fzf";
          packages = [pkgs.vimPlugins.telescope-fzf-native-nvim];
          setup = {fzf = {fuzzy = true;};};
        }
        {
          name = "file_browser";
          packages = [pkgs.vimPlugins.telescope-file-browser-nvim];
          setup = {
            file_browser = {
              path = "%:p:h";
              cwd = lib.literalExpression "function() return vim.fn.expand('%:p:h') end";
              respect_gitignore = false;
              hidden = true;
              grouped = true;
              previewer = false;
              initial_mode = "normal";
              layout_config = {
                height = 40;
              };
              hijack_netrw = true;
            };
          };
        }
      ];
    };
    luaConfigRC.telescope = ''
      require('telescope').setup{
        defaults = {
          wrap_results = true,
          layout_strategy = 'horizontal',
          layout_config = {
            prompt_position = 'top',
            preview_width = 0.55,
            width = 0.9,
            height = 0.85,
          },
          sorting_strategy = "ascending",
          winblend = 15,
          file_ignore_patterns = { "node_modules", ".git/" }
        }
      }
    '';
  };
}
