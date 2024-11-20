require("conform").setup({
	format_on_save = {

		-- These options will be passed to conform.format()
		timeout_ms = 500,
	},
	formatters_by_ft = {
		-- Conform will run multiple formatters sequentially
		-- Use a sub-list to run only the first available formatter
		lua = { "stylua" },
		python = { "isort", "black" },
		javascript = { "prettier" },
		typescript = { "prettier" },
		astro = { "prettier" },
		typescriptreact = { "prettier", "rustywind" },
		go = { "gofumpt", "goimports" },
		bash = { "shfmt" },
		yaml = { "yamlfmt" },
		json = { "prettier" },
	},
})
