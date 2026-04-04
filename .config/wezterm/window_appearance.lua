local M = {}

function M.apply(config)
	config.window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	}
	config.window_decorations = "NONE"
	config.window_frame = {
		border_left_width = "0",
		border_right_width = "0",
		border_bottom_height = "0",
		border_top_height = "0",
	}
end

return M
