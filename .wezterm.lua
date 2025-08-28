local w = require("wezterm")
return {
  window_padding = { left = 0, right = 0, top = 0, bottom = 0 },
  hide_tab_bar_if_only_one_tab = true,
  initial_cols = 90,
  initial_rows = 30,
  color_scheme = "Dehydration (Gogh)",
  font = w.font("SimSun-ExtB"),
  font_size = w.target_triple:find("windows") and 13 or 20,
  default_prog = w.target_triple:find("windows") and { "powershell.exe", "-NoLogo" },
}
