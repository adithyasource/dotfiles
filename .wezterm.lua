local w = require("wezterm")
local is_win = w.target_triple:find("windows")

w.on("format-window-title", function() return "terminal" end)

local function activate_or_create_tab(index)
  return w.action_callback(function(window, pane)
    local mux_window = window:mux_window()
    local tabs = mux_window:tabs()

    if tabs[index + 1] then
      window:perform_action(w.action.ActivateTab(index), pane)
    else
      local cwd_uri = pane:get_current_working_dir()
      local cwd = cwd_uri and cwd_uri.file_path

      window:perform_action(
        w.action.SpawnCommandInNewTab({
          cwd = cwd,
        }),
        pane
      )

      window:perform_action(w.action.ActivateTab(index), pane)
    end
  end)
end

return {
  window_padding = { left = 0, right = 0, top = 0, bottom = 0 },
  use_fancy_tab_bar = false,
  initial_cols = 90,
  initial_rows = 30,
  colors = {
    foreground = "#A0A0A0",
    background = "#303030",
    cursor_bg = "#FFFFFF",
    cursor_fg = "#232323",
    cursor_border = "#FFFFFF",
    selection_bg = "#CACACA",
    selection_fg = "#232323",
    ansi = {
      "#383838", "#9b6e6b", "#777777", "#9b806b",
      "#778060", "#767676", "#b8b8b8", "#b0b0b0"
    },
    brights = {
      "#474747", "#9b7f7d", "#8c8c8c", "#9b8c7d",
      "#a0b77d", "#a3a3a3", "#cfcfcf", "#c0c0c0"
    }
  },
  font = w.font("Paper Mono"),
  font_size = is_win and 10 or 16,
  default_prog = is_win and { "powershell.exe", "-NoLogo" },
  enable_tab_bar = false,
  keys = {
    {
      key = "q",
      mods = "ALT",
      action = activate_or_create_tab(0),
    },
    {
      key = "a",
      mods = "ALT",
      action = activate_or_create_tab(1),
    },
    {
      key = "s",
      mods = "ALT",
      action = activate_or_create_tab(2),
    },
    {
      key = "d",
      mods = "ALT",
      action = activate_or_create_tab(3),
    },
  },
}
