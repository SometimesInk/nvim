-- This plugins causes bugs with 'G', 'gg', and using the command line to goto a line number.

return {
  "arnamak/stay-centered.nvim",
  enabled = false,
  opts = {
    -- Don't let mouse scroll be uncentered.
    allow_scroll_move = false,
    -- Don't move cursor on left mouse click.
    -- Using the mouse (trackpad) whilst coding on nvim is unefficient.
    disable_on_mouse = false,
  },
}
