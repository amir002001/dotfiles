local lsp = require("lsp-zero")
local lspUtils = require("lspconfig.util")

lsp.preset("recommended")

lsp.ensure_installed({
    "tsserver",
    "bashls",
    "denols",
    "rome",
    "eslint",
    "tsserver",
    "volar",
    "lua_ls",
    "tailwindcss",
})

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
    ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
    ["<C-y>"] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
})

lsp.set_preferences({
    sign_icons = {},
})

lsp.setup_nvim_cmp({
    mapping = cmp_mappings,
})

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

lsp.on_attach(on_attach)

-- LUA_LS CONFIG
lsp.configure("lua_ls", {
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
            telemetry = {
                enable = false,
            },
        },
    },
})

-- ROME CONFIG
lsp.configure("rome", {
    root_dir = lspUtils.root_pattern("rome.json"),
    single_file_support = false,
})

-- TSSERVER CUSTOMIZATION
lsp.configure("tsserver", {
    root_dir = lspUtils.root_pattern("package.json"),
    single_file_support = false,
})

-- DENOLS CUSTOMIZATION
lsp.configure("denols", {
    root_dir = lspUtils.root_pattern("deno.json", "deno.jsonc"),
    single_file_support = false,
})

lsp.configure("tailwindcss", {
    filetypes = {
        -- html
        "aspnetcorerazor",
        "astro",
        "astro-markdown",
        "blade",
        "clojure",
        "django-html",
        "htmldjango",
        "edge",
        "eelixir", -- vim ft
        "elixir",
        "ejs",
        "erb",
        "eruby", -- vim ft
        "gohtml",
        "haml",
        "handlebars",
        "hbs",
        "html",
        -- 'HTML (Eex)',
        -- 'HTML (EEx)',
        "html-eex",
        "heex",
        "jade",
        "leaf",
        "liquid",
        "markdown",
        "mdx",
        "mustache",
        "njk",
        "nunjucks",
        "php",
        "razor",
        "slim",
        "twig",
        -- css
        "css",
        "less",
        "postcss",
        "sass",
        "scss",
        "stylus",
        "sugarss",
        -- js
        "javascript",
        "javascriptreact",
        "reason",
        "rescript",
        "typescript",
        "typescriptreact",
        -- mixed
        "vue",
        "svelte",
        -- rust
        "rust",
    },
    root_dir = lspUtils.root_pattern("tailwind.config.js", "tailwind.config.cjs"),
})

lsp.setup()

-- DUMB LSP ZERO ERRORS
vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    update_in_insert = false,
    underline = true,
    severity_sort = true,
})
