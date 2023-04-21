require("packer").startup(function(use)
    -- Packer can manage itself
    use "wbthomason/packer.nvim"

    use { "catppuccin/nvim", as = "catppuccin" }
    use "nvim-tree/nvim-web-devicons"
    use "nvim-tree/nvim-tree.lua"
    use {
        "nvim-telescope/telescope.nvim", tag = "0.1.1",
        -- or                            , branch = '0.1.x', requires = { {'nvim-lua/plenary.nvim'} }
    }
    use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
    -- use('nvim-treesitter/playground')
    use("mbbill/undotree")
    use("tpope/vim-fugitive")
    use {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v2.x",
        requires = {
            -- LSP Support
            { "neovim/nvim-lspconfig" }, -- Required
            {
                -- Optional
                "williamboman/mason.nvim",
                run = function()
                    pcall(vim.cmd, "MasonUpdate")
                end,
            },
            { "williamboman/mason-lspconfig.nvim" }, -- Optional

            -- Autocompletion
            { "hrsh7th/nvim-cmp" },     -- Required
            { "hrsh7th/cmp-nvim-lsp" }, -- Required
            { "L3MON4D3/LuaSnip" },     -- Required
        }
    }
    use({
        "folke/trouble.nvim",
        requires = "nvim-tree/nvim-web-devicons",
        config = function()
            require("trouble").setup {}
        end
    })

    use({
        "jackMort/ChatGPT.nvim",
        config = function()
            require("chatgpt").setup({
                keymaps = {
                    submit = "<C-s>",
                }
            })
        end,
        requires = {
            "MunifTanjim/nui.nvim",
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim"
        }
    })

    use("github/copilot.vim")
    use {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup()
        end
    }
    use "lukas-reineke/indent-blankline.nvim"
    use {
        "stevearc/aerial.nvim",
        config = function() require("aerial").setup() end
    }
    use {
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end
    }
    use "jose-elias-alvarez/null-ls.nvim"
    use {
        "nvim-lualine/lualine.nvim",
        requires = { "nvim-tree/nvim-web-devicons", opt = true }
    }
    use({
        "utilyre/barbecue.nvim",
        tag = "*",
        requires = {
            "SmiteshP/nvim-navic",
            "nvim-tree/nvim-web-devicons", -- optional dependency
        },
        config = function()
            require("barbecue").setup()
        end,
    })
    use("leafo/moonscript-vim")
    use {
        "ray-x/go.nvim",
        requires = {
            "ray-x/guihua.lua"
        },
        config = function()
            require("go").setup()
        end
    }
    use { "nvim-telescope/telescope-ui-select.nvim" }
    use "nvim-lua/lsp-status.nvim"
end)
