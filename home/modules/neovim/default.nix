{
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./plugins/telescope.nix
  ];

  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        viAlias = false;
        vimAlias = true;
        extraPackages = with pkgs; [fd ripgrep];

        options = {
          title = true;
          autoindent = true;
          smartindent = true;
          ignorecase = true;
          scrolloff = 10;
          shiftwidth = 2;
          tabstop = 2;
          expandtab = true;
        };

        utility.motion.flash-nvim.enable = true;
        visuals.indent-blankline.enable = true;
        comments.comment-nvim.enable = true;
        git.enable = true;
        mini.bracketed = {
          enable = true;
          setupOpts = {
            file = {suffix = "";};
            window = {suffix = "";};
            quickfix = {suffix = "";};
            yank = {suffix = "";};
            treesitter = {suffix = "n";};
          };
        };
        mini.hipatterns = {
          enable = true;
          setupOpts = {
            highlighters = {
              hsl_color = {
                pattern = "hsl%(%d+,? %d+%%?,? %d+%%?%)";
                group = ''
                  function(_, match)
                    local utils = require("solarized-osaka.hsl")
                    local nh, ns, nl = match:match("hsl%((%d+),? (%d+)%%?,? (%d+)%%?%)")
                    local h, s, l = tonumber(nh), tonumber(ns), tonumber(nl)
                    local hex_color = utils.hslToHex(h, s, l)
                    return MiniHipatterns.compute_hex_color_group(hex_color, "bg")
                  end
                '';
              };
            };
          };
        };

        lsp = {
          enable = true;
          formatOnSave = true;
        };

        theme = {
          enable = true;
          name = "catppuccin";
          style = "mocha";
          transparent = true;
        };

        statusline.lualine = {
          enable = true;
          globalStatus = true;
          icons.enable = true;
        };
        autocomplete.nvim-cmp.enable = true;
        autopairs.nvim-autopairs.enable = true;

        languages = {
          enableFormat = true;
          enableTreesitter = true;

          bash.enable = true;
          css.enable = true;
          html.enable = true;
          lua.enable = true;
          markdown.enable = true;
          nix.enable = true;
          python.enable = true;
          rust.enable = true;
          sql.enable = true;
          ts.enable = true;
          tailwind.enable = true;
        };

        ui.noice.enable = true;
        ui.borders.plugins.which-key.style = "solid";
        visuals.nvim-web-devicons.enable = true;

        luaConfigRC.options = ''
          vim.cmd [[
            highlight TelescopeNormal guibg=NONE
            highlight TelescopeBorder guibg=NONE
            highlight TelescopePromptNormal guibg=NONE
            highlight TelescopePromptBorder guibg=NONE
            highlight TelescopeResultsNormal guibg=NONE
            highlight TelescopeResultsBorder guibg=NONE
            highlight TelescopePreviewNormal guibg=NONE
            highlight TelescopePreviewBorder guibg=NONE
          ]]
        '';

        luaConfigRC.keymaps = ''
          local tb = require('telescope.builtin')
          local fb = require('telescope').extensions.file_browser

          vim.keymap.set('n', ';f', tb.find_files, { noremap = true, silent = true })         -- cari file
          vim.keymap.set('n', ';r', tb.live_grep, { noremap = true, silent = true })          -- ripgrep
          vim.keymap.set('n', '\\\\', tb.buffers, { noremap = true, silent = true })          -- list buffer
          vim.keymap.set('n', ';t', tb.tags, { noremap = true, silent = true })               -- list tags
          vim.keymap.set('n', ';;', tb.resume, { noremap = true, silent = true })             -- resume picker
          vim.keymap.set('n', ';e', tb.diagnostics, { noremap = true, silent = true })        -- list diagnostics
          vim.keymap.set('n', ';s', tb.lsp_document_symbols, { noremap = true, silent = true }) -- list functions/symbols
          vim.keymap.set('n', ';c', tb.lsp_workspace_symbols, { noremap = true, silent = true }) -- list lsp workspace symbols
          vim.keymap.set('n', 'sf', function()
            fb.file_browser({
              path = "%:p:h",
              cwd = vim.fn.expand("%:p:h"),
              hidden = true,
              grouped = true,
              previewer = false,
              initial_mode = "normal",
              layout_config = { height = 40 },
            })
          end, { noremap = true, silent = true })
        '';
      };
    };
  };
}
