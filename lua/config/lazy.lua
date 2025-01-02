local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Options
vim.opt.wrap = true

vim.opt.termguicolors = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.nu = true
vim.wo.number = true
vim.opt.relativenumber = true

vim.opt.cursorline = true

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

-- Turn .h files into C
vim.api.nvim_create_augroup("HFileAutoCmd", { clear = true })

vim.api.nvim_create_autocmd("BufRead", {
  group = "HFileAutoCmd",
  pattern = "*.h",
  callback = function()
    -- Run the specified command
    vim.cmd("set filetype=c")
  end,
})

vim.api.nvim_create_autocmd("BufNewFile", {
  group = "HFileAutoCmd",
  pattern = "*.h",
  callback = function()
    -- Run the specified command
    vim.cmd("set filetype=c")
  end,
})

-- Setup lazy.nvim plugins
require("lazy").setup({
  spec = {
    { import = "plugins/code" },
    { import = "plugins/lsp" },
    { import = "plugins/notes" },
    { import = "plugins/style" },
  },
  install = { colorscheme = { "catppuccin" } },
})
