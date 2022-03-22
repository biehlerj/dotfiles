local ok, null_ls = pcall(require, "null-ls")

if not ok then
	return
end

local b = null_ls.builtins

local sources = {

	-- JS html css stuff
	b.formatting.prettierd.with({
		filetypes = { "html", "json", "markdown", "scss", "css" },
	}),
	b.formatting.eslint_d,
	b.diagnostics.eslint.with({
		command = "eslint_d",
	}),

	-- Lua
	b.formatting.stylua,
	b.diagnostics.luacheck.with({ extra_args = { "--global vim" } }),

	-- Shell
	b.formatting.shfmt,
	b.diagnostics.shellcheck.with({ diagnostics_format = "#{m} [#{c}]" }),

	-- Python
	b.formatting.isort,
	b.diagnostics.flake8,

	-- Go
	b.formatting.golines,

	-- Rust
	b.formatting.rustfmt,

	-- Spelling
	b.diagnostics.codespell,

	-- Markdown
	b.diagnostics.markdownlint,

	-- Code actions
	b.code_actions.gitsigns,

	-- LaTeX
	b.diagnostics.chktex,
	b.formatting.latexindent,
}

local M = {}

M.setup = function()
	null_ls.setup({
		debug = true,
		sources = sources,

		-- format on save
		on_attach = function(client)
			if client.resolved_capabilities.document_formatting then
				vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
			end
		end,
	})
end

return M
