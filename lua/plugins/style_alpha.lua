-- https://github.com/goolord/alpha-nvim/discussions/16#discussioncomment-10234780
local function getLen(str, start_pos)
  local byte = string.byte(str, start_pos)
  if not byte then
    return nil
  end
  return (byte < 0x80 and 1) or (byte < 0xE0 and 2) or (byte < 0xF0 and 3) or (byte < 0xF8 and 4) or 1
end

local function darken(hex, amount)
  -- Ensure the hex string starts with '#'
  if hex:sub(1, 1) == "#" then
    hex = hex:sub(2) -- Remove the '#' character
  end

  -- Extract RGB components from the hex string
  local r = tonumber(hex:sub(1, 2), 16)
  local g = tonumber(hex:sub(3, 4), 16)
  local b = tonumber(hex:sub(5, 6), 16)

  -- Calculate the darkened color by reducing the RGB values
  r = math.max(0, r - (r * amount / 100))
  g = math.max(0, g - (g * amount / 100))
  b = math.max(0, b - (b * amount / 100))

  -- Convert the darkened RGB values back to hex and return the result
  local darkenedHex = string.format("#%02X%02X%02X", r, g, b)
  return darkenedHex
end

local function colorize(header, header_color_map, colors)
  for letter, color in pairs(colors) do
    local color_name = "AlphaJemuelKwelKwelWalangTatay" .. letter
    vim.api.nvim_set_hl(0, color_name, color)
    colors[letter] = color_name
  end

  local colorized = {}

  for i, line in ipairs(header_color_map) do
    local colorized_line = {}
    local pos = 0

    for j = 1, #line do
      local start = pos
      pos = pos + getLen(header[i], start + 1)

      local color_name = colors[line:sub(j, j)]
      if color_name then
        table.insert(colorized_line, { color_name, start, pos })
      end
    end

    table.insert(colorized, colorized_line)
  end

  return colorized
end

local alpha_c = function()
  local alpha = require("alpha")

  local dashboard = require("alpha.themes.dashboard")

  local color_map = {
    [[      AAAA]],
    [[AAAAAA  AAAA]],
    [[AA    AAAA  AAAA        KKHHKKHHHH]],
    [[AAAA    AAAA  AA    HHBBKKKKKKKKKKKKKK]],
    [[  AAAAAA      AAKKBBHHKKBBYYBBKKKKHHKKKKKK]],
    [[      AAAA  BBAAKKHHBBBBKKKKBBYYBBHHHHKKKKKK]],
    [[        BBAABBKKYYYYHHKKYYYYKKKKBBBBBBZZZZZZ]],
    [[    YYBBYYBBKKYYYYYYYYYYKKKKBBKKAAAAZZOOZZZZ]],
    [[    XXXXYYYYBBYYYYYYYYBBBBBBKKKKBBBBAAAAZZZZ]],
    [[    XXXXUUUUYYYYBBYYYYYYBBKKBBZZOOAAZZOOAAAAAA]],
    [[  ZZZZZZXXUUXXXXYYYYYYYYBBAAAAZZOOOOAAOOZZZZAAAA]],
    [[  ZZUUZZXXUUUUXXXXUUXXFFFFFFFFAAAAOOZZAAZZZZ  AA]],
    [[    RRRRUUUUZZZZZZZZXXOOFFFFOOZZOOAAAAAAZZZZAA]],
    [[    CCSSUUUUZZXXXXZZXXOOFFFFOOZZOOOOZZOOAAAA]],
    [[    CCCCUUUUUUUUUURRRROOFFFFOOZZOOOOZZOOZZZZ]],
    [[    CCCCUUUUUUUUSSCCCCEEQQQQOOZZOOOOZZOOZZZZ]],
    [[    CCCCUUGGUUUUCCCCCCEEQQQQOOZZOOOOZZEEZZ]],
    [[    RRRRGGGGUUGGCCCCCCOOOOOOOOZZOOEEZZII]],
    [[      IIRRGGGGGGCCCCCCOOOOOOOOZZEEII]],
    [[            GGRRCCCCCCOOOOEEEEII  II]],
    [[                RRRRRREEEE  IIII]],
    [[                      II]],
    [[]],
  }

  local yellow = "#FAC87C"
  local orange = "#BF854E"
  local maroon = "#502E2B"
  local brown = "#38291B"

  local rosewater = "#F5D0C5"
  local crust = "#1E1E2E"
  local mantle = "#1A1B26"
  local subtext1 = "#6C6A76"

  local colors = {
    ["A"] = { fg = rosewater },
    ["Y"] = { fg = yellow },
    ["B"] = { fg = darken(yellow, 5) },
    ["X"] = { fg = darken(yellow, 20) },
    ["U"] = { fg = darken(yellow, 25) },
    ["F"] = { fg = darken(yellow, 35) },
    ["O"] = { fg = darken(yellow, 45) },
    ["K"] = { fg = maroon },
    ["H"] = { fg = darken(maroon, 10) },
    ["Z"] = { fg = crust },
    ["G"] = { fg = darken(yellow, 25) },
    ["R"] = { fg = orange },
    ["Q"] = { fg = darken(orange, 20) },
    ["E"] = { fg = darken(orange, 35) },
    ["I"] = { fg = brown },
    ["C"] = { fg = mantle },
    ["S"] = { fg = subtext1 },
  }

  local header = {}
  for _, line in ipairs(color_map) do
    local header_line = [[]]
    for i = 1, #line do
      if line:sub(i, i) ~= " " then
        header_line = header_line .. "█"
      else
        header_line = header_line .. " "
      end
    end
    table.insert(header, header_line)
  end

  local header_add = [[ "Ceci est une pipe." ]]
  table.insert(header, header_add)

  local hl_add = {}
  for i = 1, #header_add do
    table.insert(hl_add, { "NeoBeeTitle", 1, i })
  end

  dashboard.section.header.val = header
  local colorized = colorize(header, color_map, colors)

  table.insert(colorized, hl_add)

  dashboard.section.header.opts = {
    hl = colorized,
    position = "center",
  }

  dashboard.section.buttons.val = {
    dashboard.button("n", "  nvim", '<CMD>execute "e ~/.config/nvim/init.lua" | Neotree reveal ~/.config/nvim/<CR>'),
    dashboard.button(
      "h",
      "  hypr",
      '<CMD>execute "e ~/.config/hypr/hyprland.conf" | Neotree reveal ~/.config/hypr/<CR>'
    ),
    dashboard.button("t", "  tmux", '<CMD>execute "e ~/.tmux.conf"<CR>'),
    dashboard.button(
      "t",
      "  kitty",
      '<CMD>execute "e ~/.config/kitty/kitty.conf" | Neotree reveal ~/.config/kitty/<CR>'
    ),
    dashboard.button("q", "  quit", "<CMD>q<CR>"),
  }
  for _, a in ipairs(dashboard.section.buttons.val) do
    a.opts.width = 49
    a.opts.cursor = -2
  end

  alpha.setup(dashboard.config)
end

return {
  "goolord/alpha-nvim",
  config = function()
    alpha_c()
  end,
}
