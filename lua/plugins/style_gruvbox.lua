return {
  -- add gruvbox
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    opts = function()
      require("gruvbox").setup({
        palette_overrides = {

          -- Usage example in C

          -- remaining elements:
          -- C precompiler statements
          -- file names with a ?

          -- dark0 = "#282828", -- Background
          -- dark1 = "#3c3836", -- Current working line
          -- dark2 = "#504945", -- Indent lines
          -- dark3 = "#665c54", -- Split window separator
          -- dark4 = "#7c6f64", -- Line numbers
          -- light0 = "#fbf1c7", -- .md file extension icon
          -- light1 = "#ebdbb2", -- (common white) Global variables, file names
          -- bright_red = "#fb4934", -- (common red) If, return, case, switch, break, sizeof()
          -- bright_green = "#b8bb26", -- (common green) Strings, functions, "imports"
          -- bright_yellow = "#fabd2f", -- (common yellow) Types, hovered variables and functions
          -- bright_blue = "#83a598", -- (common blue) Local variables, .c file extension icon
          -- bright_purple = "#d3869b", -- (common purple) Numbers, enum members
          -- bright_orange = "#fe8019", -- (common orange) Ponctuation, edited files
          -- gray = "#928374", -- (common gray) Comments
        },
      })
      vim.cmd("colorscheme gruvbox")
    end,
  },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
}
