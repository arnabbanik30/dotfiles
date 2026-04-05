local wezterm = require("wezterm")

local M = {}

function M.apply(config)
	config.font_size = 14
	config.line_height = 1.1
	config.font = wezterm.font("JetBrainsMono Nerd Font", { weight = "DemiBold" })
end

return M
