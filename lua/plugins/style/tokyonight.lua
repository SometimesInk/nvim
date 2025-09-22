return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    styles = {
      -- Available styles @ :help nvim_set_hl
      comments = { italic = true },
      keywords = { italic = true },
      functions = {},
      variables = {},
      -- "dark" / "transparent" / "normal"
      sidebars = "dark",
      floats = "dark",
    },
    lualine_bold = false,
  },
  config = function()
    vim.cmd.colorscheme("tokyonight-moon")
  end,
}
