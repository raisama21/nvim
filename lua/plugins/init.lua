return {
	{
		"rose-pine/neovim",
		name = "rose-pine",
		lazy = false,
		opts = function()
			return require("plugins.configs.colorscheme")
		end,
		config = function(_, opts)
			require("rose-pine").setup(opts)

			vim.cmd([[colorscheme rose-pine]])
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		opts = function()
			return require("plugins.configs.treesitter")
		end,
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},

	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
	},

	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.2",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = function()
			return require("plugins.configs.telescope")
		end,
		config = function(_, opts)
			require("telescope").setup(opts)
		end,
	},

	{
		"ThePrimeagen/harpoon",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("plugins.configs.harpoon")
		end,
	},

	{
		"williamboman/mason.nvim",
		opts = function()
			return {
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			}
		end,
		config = function(_, opts)
			require("mason").setup(opts)
		end,
	},

	{
		"williamboman/mason-lspconfig.nvim",
		opts = function()
			return {
				ensure_installed = {
					-- lua stuff
					"lua_ls",

					-- web dev stuff
					"html",
					"cssls",
					"tailwindcss",
					"tsserver",
					"emmet_ls",

					-- golang
					"gopls",

					-- database stuff
					"sqlls",
				},
			}
		end,
		config = function(_, opts)
			require("mason-lspconfig").setup(opts)
		end,
	},

	{
		"neovim/nvim-lspconfig",
		config = function()
			require("plugins.configs.lspconfig")
		end,
	},

	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
			"onsails/lspkind.nvim",
		},
		opts = function()
			return require("plugins.configs.completion")
		end,
		config = function(_, opts)
			require("cmp").setup(opts)
		end,
	},

	{
		"nvimtools/none-ls.nvim",
		event = "VeryLazy",
		opts = function()
			return require("plugins.configs.formatter")
		end,
		config = function(_, opts)
			require("null-ls").setup(opts)
		end,
	},

	{
		"tpope/vim-fugitive",
		config = function()
			vim.keymap.set("n", "<leader>gs", function()
				vim.cmd([[:0G]])
			end)
		end,
	},
}
