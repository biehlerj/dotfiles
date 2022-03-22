-- IMPORTANT NOTE : This is the user config, can be edited. Will be preserved if updated with internal updater
-- This file is for NvChad options & tools, custom settings are split between here and 'lua/custom/init.lua'
local userPlugins = require("custom.plugins")

local M = {}
M.options, M.ui, M.mappings, M.plugins = {}, {}, {}, {}

-- NOTE: To use this, make a copy with `cp example_chadrc.lua chadrc.lua`

--------------------------------------------------------------------

-- To use this file, copy the structure of `core/default_config.lua`,
-- examples of setting relative number & changing theme:

M.options = {
	relativenumber = true,
}

M.ui = {
	theme = "catppuccin",
}

-- NvChad included plugin options & overrides
M.plugins = {
	install = userPlugins,
	options = {
		lspconfig = {
			setup_lspconf = "custom.plugins.lspconfig",
		},
	},
	status = {
		esc_insertmode = false,
		dashboard = true,
	},
	default_plugin_config_replace = {
		nvim_tree = "custom.nvimtree",
		dashboard = "custom.dashboard",
	},
}

M.mappings = {
	copy_whole_file = "<A-a>",
}

return M
