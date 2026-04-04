local wezterm = require("wezterm")
local config = wezterm.config_builder()

require("fonts").apply(config)
require("window_appearance").apply(config)

return config
