local wezterm = require("wezterm")

local M = {}

function M.apply(config)
	-- https://wezterm.org/config/lua/config/font_size.html
	config.font_size = 14
	-- https://wezterm.org/config/lua/config/line_height.html
	config.line_height = 1.1
	-- https://wezterm.org/config/lua/wezterm/font.html#weztermfontfamily-attributes
	config.font = wezterm.font("JetBrainsMono Nerd Font", { weight = "DemiBold" })
end

return M
