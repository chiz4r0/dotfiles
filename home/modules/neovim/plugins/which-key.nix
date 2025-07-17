{...}: {
  programs.nvf.settings.vim = {
    ui.borders.plugins.whitch-key = {
      enable = true;
      style = "rounded";
    };
    luaConfigRC.whichkey = ''
      require("which-key").register({
        [";f"] = { "<cmd>lua require('telescope.builtin').find_files()<CR>", "Find Files" },
        [";r"] = { "<cmd>lua require('telescope.builtin').live_grep()<CR>", "Ripgrep Search" },
        ["\\\\"] = { "<cmd>lua require('telescope.builtin').buffers()<CR>", "List Buffers" },
        [";t"] = { "<cmd>lua require('telescope.builtin').tags()<CR>", "Tags" },
        [";;"] = { "<cmd>lua require('telescope.builtin').resume()<CR>", "Resume Picker" },
        [";e"] = { "<cmd>lua require('telescope.builtin').diagnostics()<CR>", "Diagnostics" },
        [";s"] = { "<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>", "Document Symbols" },
        [";c"] = { "<cmd>lua require('telescope.builtin').lsp_workspace_symbols()<CR>", "Workspace Symbols" },
        ["sf"]  = { "<cmd>lua require('telescope').extensions.file_browser.file_browser({ initial_mode = 'normal' })<CR>", "Open File Browser" },
      }, { mode = "n" })
    '';
  };
}
