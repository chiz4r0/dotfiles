
{ config, pkgs, lib, ... }:

{
  imports = [
    ./plugins/colorschema.nix
  ];

  programs.nixvim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    
    # Options
    globals = {
  	  mapleader = " ";
    };

    # KeyMap

    keymaps = [
      {
        action = "<cmd>Neotree toggle<CR>";
        key = "<leader>e";
      }

      # Telescope
      
      {
        action = "<cmd>Telescope live_grep<CR>";
        key = "<leader>fw";
      }
      {
        action = "<cmd>Telescope find_files<CR>";
        key = "<leader>ff";
      }
      {
        action = "<cmd>Telescope git_commits<CR>";
        key = "<leader>fg";
      }
      {
        action = "<cmd>Telescope oldfiles<CR>";
        key = "<leader>fh";
      }
      {
        action = "<cmd>Telescope colorscheme<CR>";
        key = "<leader>ch";
      }
      {
        action = "<cmd>Telescope man_pages<CR>";
        key = "<leader>fm";
      }

    ];

    opts = {
      encoding = "utf-8";
      fileencoding = "utf-8";
      number = true;
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

    plugins.lualine.enable = true;
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
