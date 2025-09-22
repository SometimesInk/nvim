-- Define leader
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Options
vim.opt.wrap = true

vim.opt.termguicolors = true

vim.api.nvim_set_option("clipboard", "unnamedplus")

-- Tab equals 2 spaces
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.nu = true
vim.wo.number = true
vim.opt.relativenumber = true

vim.opt.cursorline = true
