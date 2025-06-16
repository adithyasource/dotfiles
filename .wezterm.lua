local wt = require 'wezterm'
local config = {
  window_padding = {
    left = 2,
    right = 2,
    top = 0,
    bottom = 0,
  },
  hide_tab_bar_if_only_one_tab = true,
  font_size = 13.0,
  initial_cols = 90,
  initial_rows = 30,
  font = wt.font("SimSun-ExtB"),
  colors = {
    foreground = "#A0A0A0",
    background = "#232323",
    cursor_bg = "#FFFFFF",
    cursor_fg = "#232323",
    cursor_border = "#FFFFFF",
    selection_bg = "#CACACA",
    selection_fg = "#232323",
    ansi = {
      "#383838", -- black
      "#A95551", -- red
      "#666666", -- green
      "#A98051", -- yellow
      "#657D3E", -- blue
      "#767676", -- magenta
      "#C9C9C9", -- cyan
      "#BABABA", -- white
    },
    brights = {
      "#474747", -- bright black
      "#A97775", -- bright red
      "#8C8C8C", -- bright green
      "#A99175", -- bright yellow
      "#98BD5E", -- bright blue
      "#A3A3A3", -- bright magenta
      "#DCDCDC", -- bright cyan
      "#CACACA", -- bright white
    },
  }
}

if wt.target_triple:find("apple") then
  config.font_size = 20
elseif wt.target_triple:find("windows") then
  config.default_prog = { "powershell.exe", "-NoLogo" }
end

return config

