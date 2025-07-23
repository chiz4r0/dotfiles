{
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./configs/options.nix
    ./configs/keymaps.nix
    ./plugins/telescope.nix
    ./plugins/themes.nix
  ];

  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        viAlias = false;
        vimAlias = true;
        extraPackages = with pkgs; [fd ripgrep nodePackages.prettier];

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
        visuals.rainbow-delimiters.enable = true;
        visuals.nvim-web-devicons.enable = true;
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
          null-ls = {
            enable = true;
          };
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

        #ui.noice.enable = true;
        ui.borders.plugins.which-key.style = "solid";
      };
    };
  };
}
