-- LOCALS
local lsp_zero = require("lsp-zero")
local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }

local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local lspconfig = require("lspconfig")

local on_attach = function(_, bufnr)
	local opts = { buffer = bufnr, remap = false }
	vim.keymap.set("n", "gd", function()
		vim.lsp.buf.definition()
	end, opts)
	vim.keymap.set("n", "K", function()
		vim.lsp.buf.hover()
	end, opts)
	vim.keymap.set("n", "<leader>vws", function()
		---@diagnostic disable-next-line: missing-parameter
		vim.lsp.buf.workspace_symbol()
	end, opts)
	vim.keymap.set("n", "<leader>vd", function()
		vim.diagnostic.open_float()
	end, opts)
	vim.keymap.set("n", "[d", function()
		vim.diagnostic.goto_next()
	end, opts)
	vim.keymap.set("n", "]d", function()
		vim.diagnostic.goto_prev()
	end, opts)
	vim.keymap.set("n", "<leader>vca", function()
		vim.lsp.buf.code_action()
	end, opts)
	vim.keymap.set("n", "<leader>vrr", function()
		vim.lsp.buf.references()
	end, opts)
	vim.keymap.set("n", "<leader>vrn", function()
		vim.lsp.buf.rename()
	end, opts)
	vim.keymap.set("i", "<C-h>", function()
		vim.lsp.buf.signature_help()
	end, opts)
end

lsp_zero.set_preferences({
	sign_icons = {},
})

cmp.setup({
	mapping = cmp.mapping.preset.insert({
		-- next and prev items
		["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
		["<C-n>"] = cmp.mapping.select_next_item(cmp_select),

		-- complete
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-y>"] = cmp.mapping.confirm({ select = true }),

		-- scroll up and down the documentation window
		["<C-u>"] = cmp.mapping.scroll_docs(-4),
		["<C-d>"] = cmp.mapping.scroll_docs(4),
	}),
})

lsp_zero.on_attach(on_attach)

-- LSP CONFIGS

vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	update_in_insert = false,
	underline = true,
	severity_sort = true,
})

mason.setup({})
mason_lspconfig.setup({
	ensure_installed = { "ts_ls", "rust_analyzer", "astro", "html", "eslint", "golangci_lint_ls" },
	handlers = {
		lsp_zero.default_setup,
		lua_ls = function()
			lspconfig.lua_ls.setup({
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			})
		end,
	},
})

-- RUST

require("lspconfig").rust_analyzer.setup({
	settings = {
		["rust-analyzer"] = {
			diagnostics = {
				enable = false,
			},
		},
	},
})

-- WEB

require("lspconfig").emmet_language_server.setup({})

require("lspconfig").astro.setup({})

require("lspconfig").html.setup({})

require("lspconfig").eslint.setup({})

require("lspconfig").tailwindcss.setup({})

require("lspconfig").ts_ls.setup({})

-- LUA

require("lspconfig").lua_ls.setup({
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT", -- Lua version (most likely LuaJIT)
			},
			diagnostics = {
				globals = { "vim" }, -- Recognize `vim` global variable
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			},
			telemetry = {
				enable = false, -- Disable telemetry
			},
		},
	},
})

-- GO

require("lspconfig").gopls.setup({})

require("lspconfig").golangci_lint_ls.setup({})

-- SHELL

require("lspconfig").bashls.setup({})

-- YAML
require("lspconfig").yamlls.setup({
	capabilities = {
		textDocument = {
			foldingRange = {
				dynamicRegistration = false,
				lineFoldingOnly = true,
			},
		},
	},
	redhat = {
		telemetry = {
			enabled = false,
		},
	},
})

-- JSON
require("lspconfig").jsonls.setup({})
