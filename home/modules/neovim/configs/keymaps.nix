{...}: {
  programs.nvf.settings.vim = {
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
}
