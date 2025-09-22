local builtin = require("telescope.builtin")

return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    defaults = {
      prompt_prefix = " ",
      selection_caret = " ",
      path_display = { "smart" },
      layout_strategy = "horizontal",
      layout_config = { prompt_position = "top" },
      sorting_strategy = "ascending",
      winblend = 0,
    },
  },
  keys = {
    { "<leader>ff", builtin.find_files, desc = "Telescope find files", mode = { "n" } },
    { "<leader>fg", builtin.live_grep, desc = "Telescope live grep", mode = { "n" } },
    { "<leader>fb", builtin.buffers, desc = "Telescope buffers", mode = { "n" } },
    { "<leader>fh", builtin.help_tags, desc = "Telescope help tags", mode = { "n" } },
  },
}
