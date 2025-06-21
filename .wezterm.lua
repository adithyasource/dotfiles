local wt = require("wezterm")

local config = {
  window_padding = { left = 0, right = 0, top = 0, bottom = 0 },
  hide_tab_bar_if_only_one_tab = true,
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
    ansi = { "#383838", "#A95551", "#666666", "#A98051", "#657D3E", "#767676", "#C9C9C9", "#BABABA", },
    brights = { "#474747", "#A97775", "#8C8C8C", "#A99175", "#98BD5E", "#A3A3A3", "#DCDCDC", "#CACACA", },
  },
}

if wt.target_triple:find("apple") then
  config.font_size = 20
elseif wt.target_triple:find("windows") then
  config.font_size = 13
  config.default_prog = { "powershell.exe", "-NoLogo" }
end

return config
