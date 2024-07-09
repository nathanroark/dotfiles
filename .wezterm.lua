-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

local act = wezterm.action

-- This is where you actually apply your config choices

config.font = wezterm.font("JetBrains Mono")
config.color_scheme = "Kasugano (terminal.sexy)"

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

config.keys = {
	{ key = "LeftArrow",  mods = "CTRL|ALT", action = act.MoveTabRelative(-1) },
	{ key = "RightArrow", mods = "CTRL|ALT", action = act.MoveTabRelative(1) },
	{ key = "LeftArrow",  mods = "ALT",      action = act.ActivateTabRelative(-1) },
	{ key = "RightArrow", mods = "ALT",      action = act.ActivateTabRelative(1) },
}

--Requires Wayland
config.enable_wayland = false
-- config.window_background_opacity = 7.0

-- and finally, return the configuration to wezterm
return config
