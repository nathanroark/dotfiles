-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

config.font = wezterm.font("JetBrains Mono")
config.font_size = 24.0
config.color_scheme = "Kasugano (terminal.sexy)"
config.colors = {
	-- The default text color
	-- foreground = "silver",
	-- The default background color
	background = "hsl(0, 0%, 5%)",
}

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

-- -- -- Needed to edit the keybindings
-- local act = wezterm.action
-- --
-- -- Better tabs in Tab Bar if using tabs (currently using tmux instead)
-- config.keys = {
-- 	{ key = "LeftArrow", mods = "CTRL|ALT", action = act.MoveTabRelative(-1) },
-- 	{ key = "RightArrow", mods = "CTRL|ALT", action = act.MoveTabRelative(1) },
-- 	{ key = "LeftArrow", mods = "ALT", action = act.ActivateTabRelative(-1) },
-- 	{ key = "RightArrow", mods = "ALT", action = act.ActivateTabRelative(1) },
-- }

--Requires Wayland
-- config.enable_wayland = true
config.window_background_opacity = 0.80
config.macos_window_background_blur = 25
-- config.window_background_opacity = 1.0

-- Use ALT instead of SHIFT to bypass application mouse reporting
-- config.bypass_mouse_reporting_modifiers = "ALT"

-- Disable Tab Bar
config.enable_tab_bar = false

-- and finally, return the configuration to wezterm
return config