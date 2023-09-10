--- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
    -- Packer can manage itself
    use("wbthomason/packer.nvim")
    use({
        "nvim-telescope/telescope.nvim",
        -- or                            , branch = '0.1.x',
        requires = { { "nvim-lua/plenary.nvim" } },
    })

    use("nvim-telescope/telescope-symbols.nvim")
    use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
    use("mbbill/undotree")

    -- git
    use("tpope/vim-fugitive")
    use("lewis6991/gitsigns.nvim")

    -- Theme
    use("Mofiqul/dracula.nvim")
    -- use({ "rose-pine/neovim", as = "rose-pine" })
    -- transparent bg
    use("xiyaowong/transparent.nvim")
    -- null-ls and mason-null-ls
    use("jay-babu/mason-null-ls.nvim")
    use("jose-elias-alvarez/null-ls.nvim")

    --LuaLine
    use({
        "nvim-lualine/lualine.nvim",
        requires = { "kyazdani42/nvim-web-devicons", opt = true },
    })

    --LSP ZERO STUFF

    use({
        "VonHeikemen/lsp-zero.nvim",
        branch = "v1.x",
        requires = {
            { "neovim/nvim-lspconfig" },    -- Required
            { "williamboman/mason.nvim" },  -- Optional
            { "williamboman/mason-lspconfig.nvim" }, -- Optional

            -- Autocompletion
            { "hrsh7th/nvim-cmp" }, -- Required
            { "hrsh7th/cmp-nvim-lsp" }, -- Required
            { "hrsh7th/cmp-buffer" }, -- Optional
            { "hrsh7th/cmp-path" }, -- Optional
            { "saadparwaiz1/cmp_luasnip" }, -- Optional
            { "hrsh7th/cmp-nvim-lua" }, -- Optional

            -- Snippets
            { "L3MON4D3/LuaSnip" },    -- Required
            { "rafamadriz/friendly-snippets" }, -- Optional
        },
    })

    -- Comment
    use({
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end,
    })

    --error trouble
    use("nvim-tree/nvim-web-devicons")
    use({
        "folke/trouble.nvim",
        requires = "nvim-tree/nvim-web-devicons",
        config = function()
            require("trouble").setup({
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            })
        end,
    })

    -- MARKDOWN PREVIEWER
    use({
        "iamcco/markdown-preview.nvim",
        run = "cd app && npm install",
        setup = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
        ft = { "markdown" },
    })

    -- NVIM SURROUND
    use({
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end,
    })
    -- auto pairs
    use({
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup({})
        end,
    })
    use("eandrju/cellular-automaton.nvim")

    -- chad go

    -- dap
    use("mfussenegger/nvim-dap")
    use("rcarriga/nvim-dap-ui")
    use("theHamsta/nvim-dap-virtual-text")
    use("nvim-telescope/telescope-dap.nvim")
    use("leoluz/nvim-dap-go")

    -- neovim dev
    use({
        "folke/neodev.nvim",
        config = function()
            require("neodev").setup()
        end,
    })

    -- le duck? 🦆
    use("tamton-aquib/duck.nvim")

    -- folds
    use({ "kevinhwang91/nvim-ufo", requires = "kevinhwang91/promise-async" })
end)
