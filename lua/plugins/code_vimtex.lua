return {
  "lervag/vimtex",
  lazy = false, -- lazy-loading will disable inverse search
  init = function()
    -- VimTeX configuration goes here, e.g.
    vim.g.vimtex_view_method = "zathura"
    vim.api.nvim_set_keymap("n", "<leader>cB", ":VimtexView<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<leader>cb", ":VimtexCompile<CR>", { noremap = true, silent = true })
  end,
  config = function()
    vim.g.vimtex_mappings_disable = { ["n"] = { "K" } } -- disable `K` as it conflicts with LSP hover
    vim.g.vimtex_quickfix_method = vim.fn.executable("pplatex") == 1 and "pplatex" or "latexlog"
  end,
  keys = {
    { "<localLeader>l", "", desc = "+vimtex", ft = "tex" },
  },
}
