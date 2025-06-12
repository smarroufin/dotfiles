local wezterm = require("wezterm")

local config = wezterm.config_builder()
local act = wezterm.action

config.color_scheme = "carbonfox"
config.font = wezterm.font("OverpassM Nerd Font Mono")
config.window_decorations = "RESIZE"
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }

-- persistent domain
-- config.unix_domains = { { name = "unix" } }
-- config.default_gui_startup_args = { "connect", "unix" }

-- https://wezterm.org/config/default-keys.html
-- config.leader = { mods = "CTRL", key = "a", timeout_milliseconds = 1000 }
-- config.disable_default_key_bindings = true
-- config.keys = {
	-- { mods = "SUPER", key = "p", action = act.ActivateCommandPalette },
	-- { mods = "SUPER", key = "n", action = act.SpawnWindow },
	-- tabs
	-- { mods = "SUPER", key = "t", action = act.SpawnTab("CurrentPaneDomain") },
	-- { mods = "SUPER", key = "w", action = act.CloseCurrentTab({ confirm = true }) },
	-- panes
	-- { mods = "SUPER", key = "s", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
	-- { mods = "SUPER", key = "v", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	-- { mods = "SUPER", key = "x", action = act.CloseCurrentPane({ confirm = true }) },
	-- { mods = "SUPER", key = "h", action = act.ActivatePaneDirection("Left") },
	-- { mods = "SUPER", key = "j", action = act.ActivatePaneDirection("Down") },
	-- { mods = "SUPER", key = "k", action = act.ActivatePaneDirection("Up") },
	-- { mods = "SUPER", key = "l", action = act.ActivatePaneDirection("Right") },
-- }
-- for i = 1, 9 do
-- 	table.insert(config.keys, { mods = "SUPER", key = tostring(i), action = act.ActivateTab(i - 1) })
-- end

-- display leader active
-- wezterm.on("update-right-status", function(window, _)
-- 	local prefix = ""
-- 	if window:leader_is_active() then
-- 		prefix = " " .. utf8.char(0x26aa) .. " "
-- 	end
-- 	window:set_left_status(wezterm.format({
-- 		{ Background = { Color = "#000000" } },
-- 		{ Text = prefix },
-- 	}))
-- end)

return config
