local wezterm = require("wezterm")
local config = wezterm.config_builder()

require("fonts").apply(config)
require("window_appearance").apply(config)
require("tab_bar").apply(config)
require("colorscheme").apply(config)

return config
