local wt = require("wezterm")

wt.on('format-window-title', function () return 'terminal' end)
local platformIs = function(s) return wt.target_triple:find(s) end

return {
  window_padding = { left = 0, right = 0, top = 0, bottom = 0 },
  hide_tab_bar_if_only_one_tab = true,
  initial_cols = 90,
  initial_rows = 30,
  color_scheme = "Dehydration (Gogh)",
  font = wt.font("SimSun-ExtB"),
  font_size = platformIs("windows") and 13 or 20,
  default_prog = platformIs("windows") and { "powershell.exe", "-NoLogo" },
}
