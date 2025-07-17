{...}: {
  programs.nvf.settings.vim = {
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
  };
}
