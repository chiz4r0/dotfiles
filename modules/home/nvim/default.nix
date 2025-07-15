
{ config, pkgs, lib, ... }:

{
  programs.nixvim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    
    # Options
    globals = {
  	  mapleader = " ";
    };

    colorschemes.catppuccin = {
      enable = true;
      settings.transparent_background = true;
    };

    # KeyMap

    keymaps = [
      {
        mode = "n";
        key = "<leader>xx";
        action = "<cmd>TroubleToggle<CR>";
        options.desc = "Toggle Trouble diagnostics";
      }
        
      {
        action = "<cmd>Neotree toggle<CR>";
        key = "<leader>e";
      }

      # Telescope

     {
        mode = "n";  # Normal mode
        key = "sf";
        action = ''
          function()
            local telescope = require("telescope")

            local function telescope_buffer_dir()
              return vim.fn.expand("%:p:h")
            end

            telescope.extensions.file_browser.file_browser({
              path = "%:p:h",
              cwd = telescope_buffer_dir(),
              respect_gitignore = false,
              hidden = true,
              grouped = true,
              previewer = false,
              initial_mode = "normal",
              layout_config = { height = 40 },
            })
          end
        '';
        lua = true;
        options.desc = "Open File Browser with the path of the current buffer";
      }

      {
        mode = "n";
        key = ";f";
        action = ''
          function()
            local builtin = require("telescope.builtin")
            builtin.find_files({
              no_ignore = false,
              hidden = true,
            })
          end
        '';
        lua = true;
        options.desc = "Lists files in your current working directory, respects .gitignore";
      }

      {
        mode = "n";
        key = ";r";
        action = ''
          function()
            local builtin = require("telescope.builtin")
            builtin.live_grep({
              additional_args = { "--hidden" },
            })
          end
        '';
        lua = true;
        options.desc = "Search for a string in your current working directory and get results live as you type, respects .gitignore";
      }

      {
        mode = "n";
        key = "\\\\";
        action = ''
          function()
            local builtin = require("telescope.builtin")
            builtin.buffers()
          end
        '';
        lua = true;
        options.desc = "Lists open buffers";
      }

      {
        mode = "n";
        key = ";t";
        action = ''
          function()
            local builtin = require("telescope.builtin")
            builtin.help_tags()
          end
        '';
        lua = true;
        options.desc = "Lists available help tags and opens a new window with the relevant help info on <cr>";
      }

      {
        mode = "n";
        key = ";;";
        action = ''
          function()
            local builtin = require("telescope.builtin")
            builtin.resume()
          end
        '';
        lua = true;
        options.desc = "Resume the previous telescope picker";
      }

      {
        mode = "n";
        key = ";e";
        action = ''
          function()
            local builtin = require("telescope.builtin")
            builtin.diagnostics()
          end
        '';
        lua = true;
        options.desc = "Lists Diagnostics for all open buffers or a specific buffer";
      }

      {
        mode = "n";
        key = ";s";
        action = ''
          function()
            local builtin = require("telescope.builtin")
            builtin.treesitter()
          end
        '';
        lua = true;
        options.desc = "Lists Function names, variables, from Treesitter";
      }

      {
        mode = "n";
        key = ";c";
        action = ''
          function()
            local builtin = require("telescope.builtin")
            builtin.lsp_incoming_calls()
          end
        '';
        lua = true;
        options.desc = "Lists LSP incoming calls for word under the cursor";
      }
      
    ];

    opts = {
      encoding = "utf-8";
      fileencoding = "utf-8";
      number = true;
      relativenumber = true;
      title = true;
      autoindent = true;
      smartindent = true;
      backup = false;
      showcmd = true;
      cmdheight = 1;
      laststatus = 3;
      expandtab = true;
      shell = "zsh";
      ignorecase = true;
      breakindent = true;
      smarttab = true;
      shiftwidth = 2;
      tabstop = 2;
      wrap = false;
    };
    plugins.web-devicons.enable = true;

    plugins.lsp = {
      enable = true;

      servers = {
        # Untuk TypeScript, JavaScript, dan TSX
        tsserver.enable = true;

        # Untuk linting JavaScript/TypeScript (optional, tapi disarankan)
        eslint.enable = true;

        # Untuk Golang
        gopls.enable = true;
      };

      keymaps = {
        lspBuf = {
          "gd" = "definition";
          "gD" = "references";
          "gt" = "type_definition";
          "gi" = "implementation";
          "K" = "hover";
          "<leader>a" = "code_action";
          "<leader>rn" = "rename";
        };
        diagnostic = {
          "<leader>j" = "goto_next";
          "<leader>k" = "goto_prev";
        };
      };
    };

    plugins.treesitter = {
      enable = true;

    };


    plugins.lualine.enable = true;
    plugins.nvim-autopairs.enable = true;
    plugins.trouble.enable = true;
    plugins.luasnip.enable = true;
    plugins.neo-tree = {
      enable = true;
      enableDiagnostics = true;
      enableGitStatus = true;
      enableModifiedMarkers = true;
      enableRefreshOnWrite = true;
      closeIfLastWindow = true;
      popupBorderStyle = "rounded"; # Type: null or one of “NC”, “double”, “none”, “rounded”, “shadow”, “single”, “solid” or raw lua code
      buffers = {
        bindToCwd = false;
        followCurrentFile = {
          enabled = true;
        };
      };
      window = {
        width = 40;
        height = 15;
        autoExpandWidth = false;
        mappings = {
          "<space>" = "none";
        };
      };
    };

    # Telescope
    plugins.telescope = {
      enable = true;
      extensions = {
        fzf-native = {
          enable = true;
        };
        file-browser = {
          enable = true;
        };
      };
      settings = {
        defaults = {
          vimgrep_arguments = [ "${pkgs.ripgrep}/bin/rg" "-L" "--color=never" "--no-heading" "--with-filename" "--line-number" "--column" "--smart-case" "--fixed-strings" ];
          selection_caret = "  ";
          entry_prefix = "  ";
          layout_strategy = "flex";
          layout_config = {
            horizontal = {
              prompt_position = "top";
            };
          };
          sorting_strategy = "ascending";
          file_ignore_patterns = [ "^.git/" "^.mypy_cache/" "^__pycache__/" "^output/" "^data/" "%.ipynb" ];
          set_env.COLORTERM = "truecolor";
        };

        pickers = {
          colorscheme = {
            enable_preview = true;
          };
        };
      };
    };

    extraPackages = with pkgs; [ ripgrep ];

  };
}
