local M = {}

function M.apply(config)
	-- https://wezterm.org/config/lua/config/window_padding.html?h=window_padding
	config.window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	}
	-- https://wezterm.org/config/lua/config/window_decorations.html?h=window_deco
	config.window_decorations = "RESIZE"
	-- https://wezterm.org/config/lua/config/window_frame.html
	config.window_frame = {
		border_left_width = "0",
		border_right_width = "0",
		border_bottom_height = "0",
		border_top_height = "0",
	}
end

return M
