-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

config.font = wezterm.font("JetBrains Mono")
config.color_scheme = "Kasugano (terminal.sexy)"

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

-- -- Needed to edit the keybindings
-- local act = wezterm.action
--
-- -- Better tabs in Tab Bar if using tabs (currently using tmux instead)
-- config.keys = {
-- 	{ key = "LeftArrow", mods = "CTRL|ALT", action = act.MoveTabRelative(-1) },
-- 	{ key = "RightArrow", mods = "CTRL|ALT", action = act.MoveTabRelative(1) },
-- 	{ key = "LeftArrow", mods = "ALT", action = act.ActivateTabRelative(-1) },
-- 	{ key = "RightArrow", mods = "ALT", action = act.ActivateTabRelative(1) },
-- }

--Requires Wayland
-- config.enable_wayland = false
-- config.window_background_opacity = 7.0

-- Use ALT instead of SHIFT to bypass application mouse reporting
config.bypass_mouse_reporting_modifiers = "ALT"

-- Disable Tab Bar
config.enable_tab_bar = false

-- and finally, return the configuration to wezterm
return config
