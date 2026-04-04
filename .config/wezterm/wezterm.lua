local wezterm = require("wezterm")
local config = wezterm.config_builder()

require("fonts").apply(config)
return config
