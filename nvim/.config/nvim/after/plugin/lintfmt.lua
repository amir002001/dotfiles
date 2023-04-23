local null_ls = require("null-ls")
local lsp = require("lsp-zero")
local null_opts = lsp.build_options("null-ls", {})

local function rome_config_exists()
	local current_dir = vim.fn.getcwd()
	local config_file = current_dir .. "/rome.json"
	if vim.fn.filereadable(config_file) == 1 then
		return true
	end

	return false
end

require("mason").setup()
require("mason-null-ls").setup({
	ensure_installed = {
		-- Opt to list sources here, when available in mason.
	},
	automatic_installation = false,
	handlers = {},
})

null_ls.setup({
	on_attach = function(client, bufnr)
		null_opts.on_attach(client, bufnr)
	end,
	sources = {
		-- formatting
		null_ls.builtins.formatting.rome.with({
			filetypes = {
				"json",
				"svelte",
				"javascript",
				"javascriptreact",
				"vue",
				"typescript",
				"typescriptreact",
				"svelte",
			},
			condition = function()
				return rome_config_exists()
			end,
		}),
		null_ls.builtins.formatting.prettierd.with({
			filetypes = {
				"javascript",
				"javascriptreact",
				"vue",
				"typescript",
				"typescriptreact",
				"svelte",
				"json",
				"jsonc",
				"css",
			},
			condition = function()
				return not rome_config_exists()
			end,
		}),
	},
})
