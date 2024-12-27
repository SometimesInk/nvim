-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Unbind arrow keys
vim.api.nvim_set_keymap("n", "<Up>", "", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Down>", "", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Left>", "", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Right>", "", { noremap = true, silent = true })

vim.api.nvim_set_keymap("i", "<Up>", "", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<Down>", "", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<Left>", "", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<Right>", "", { noremap = true, silent = true })

vim.api.nvim_set_keymap("v", "<Up>", "", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<Down>", "", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<Left>", "", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<Right>", "", { noremap = true, silent = true })

vim.api.nvim_set_keymap("c", "<Up>", "", { noremap = true, silent = true })
vim.api.nvim_set_keymap("c", "<Down>", "", { noremap = true, silent = true })
vim.api.nvim_set_keymap("c", "<Left>", "", { noremap = true, silent = true })
vim.api.nvim_set_keymap("c", "<Right>", "", { noremap = true, silent = true })

-- Toggle diagnostics off
vim.g["diagnostics_active"] = true
function Toggle_diagnostics()
  if vim.g.diagnostics_active then
    vim.g.diagnostics_active = false
    vim.diagnostic.disable()
  else
    vim.g.diagnostics_active = true
    vim.diagnostic.enable()
  end
end

vim.keymap.set(
  "n",
  "<leader>xd",
  Toggle_diagnostics,
  { noremap = true, silent = true, desc = "Toggle vim diagnostics" }
)
