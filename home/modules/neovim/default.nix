{
  lib,
  pkgs,
  ...
}: {
  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        viAlias = false;
        vimAlias = true;

        options = {
          shiftwidth = 2;
          tabstop = 2;
          expandtab = true;
        };

        utility.motion.flash-nvim.enable = true;
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
          name = "tokyonight";
          style = "storm";
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

        keymaps = [
          {
            mode = ["n"];
            key = "sf";
            action = ":Telescope file_browser<CR>";
            silent = true;
            desc = "Open file telescope file browser";
          }
        ];
      };
    };
  };
}
