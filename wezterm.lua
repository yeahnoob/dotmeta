local wezterm = require 'wezterm'
local act = wezterm.action

return {
	default_prog = { 'C:\\Program Files\\PowerShell\\7\\pwsh.exe' },
	wsl_domains = {
		{
			name = 'Linux in WSL2',
			distribution = 'Ubuntu-22.04',
			default_cwd = '~/',
		},
	},
	-- window_background_opacity = 0.7,
	-- window_background_image = 'C:\\Users\\yeahnoob\\Pictures\\tsy_in_the_valley_art_design.png',
	text_background_opacity = 0.3,
	color_scheme = 'Gruvbox Dark',
	-- font = wezterm.font_with_fallback({
	-- 	-- { family = 'Operator Mono Lig', weight = 'DemiLight'},
	-- 	{ family = 'Operator Mono Lig', weight = 325, italic = false },
	-- 	'CaskaydiaCove NF Mono',
	-- }),
	font = wezterm.font('CaskaydiaCove NF Mono'),
	font_size = 14.0,
	launch_menu = {
		{
			-- Optional label to show in the launcher. If omitted, a label
			-- is derived from the `args`
			-- The argument array to spawn.  If omitted the default program
			-- will be used as described in the documentation above

			-- You can specify an alternative current working directory;
			-- if you don't specify one then a default based on the OSC 7
			-- escape sequence will be used (see the Shell Integration
			-- docs), falling back to the home directory.
			-- cwd = "/some/path"

			-- You can override environment variables just for this command
			-- by setting this here.  It has the same semantics as the main
			-- set_environment_variables configuration option described above
			-- set_environment_variables = { FOO = "bar" },
		},
	},
	keys = {
		{ key = '1', mods = 'ALT', action = act.ActivateTab(0) },
		{ key = '2', mods = 'ALT', action = act.ActivateTab(1) },
		{ key = '3', mods = 'ALT', action = act.ActivateTab(2) },
		{ key = '4', mods = 'ALT', action = act.ActivateTab(3) },
		{ key = '5', mods = 'ALT', action = act.ActivateTab(4) },
		{
			key = 'T',
			mods = 'CTRL|SHIFT',
			action = act.SpawnTab {
				DomainName = 'Linux in WSL2',
			},
		},
	},
}
