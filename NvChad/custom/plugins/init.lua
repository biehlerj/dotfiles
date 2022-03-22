-- Example plugins file!
-- (suggestion) -> lua/custom/plugins/init.lua or anywhere in custom dir

return {
	{
		"williamboman/nvim-lsp-installer",
		config = function()
			require("custom.plugins.lspconfig")
		end,
	},
	{
		"jose-elias-alvarez/null-ls.nvim",
		after = "nvim-lspconfig",
		config = function()
			require("custom.plugins.null-ls").setup()
		end,
	},
	{
		"vimwiki/vimwiki",
		config = function()
			require("custom.plugins.vimwiki")
		end,
	},
	{ "wakatime/vim-wakatime" },
	{
		"lervag/vimtex",
		after = "nvim-lspconfig",
		ft = "tex",
		config = function()
			require("custom.plugins.vimtex")
		end,
	},
	{
		"luukvbaal/stabilize.nvim",
		config = function()
			require("stabilize").setup()
		end,
	},
	{
		"glepnir/dashboard-nvim",
		config = function()
			require("custom.dashboard")
		end,
	},
}
