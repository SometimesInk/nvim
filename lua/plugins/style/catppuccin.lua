return {
  "catppuccin/nvim",
  enabled = false,
  name = "catppuccin",
  priority = 1000,
  opts = {
    flavour = "mocha",
  },
  config = function()
    vim.cmd.colorscheme "catppuccin"
  end
}
