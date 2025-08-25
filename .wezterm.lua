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
    ansi = { "#383838", "#9b6e6b", "#777777", "#9b806b", "#778060", "#767676", "#b8b8b8", "#b0b0b0", },
    brights = { "#474747", "#9b7f7d", "#8c8c8c", "#9b8c7d", "#a0b77d", "#a3a3a3", "#cfcfcf", "#c0c0c0", },
  }
}

if wt.target_triple:find("apple") then
  config.font_size = 20
elseif wt.target_triple:find("windows") then
  config.font_size = 13
  config.default_prog = { "powershell.exe", "-NoLogo" }
end

wt.on('format-window-title', function () return 'terminal' end)

return config
