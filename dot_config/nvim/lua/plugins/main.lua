return {
	{
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
	},
	{
		'https://github.com/neovim/nvim-lspconfig'
	},
	{
		"ibhagwan/fzf-lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {}
	},
	{
    "lewis6991/gitsigns.nvim"
	},
	{
    "numToStr/Comment.nvim",
    opts = {},
    lazy = false,
	},
	{
  'stevearc/conform.nvim',
  opts = {
	  formatters_by_ft = {
	    lua = { "stylua" },
	    python = { "isort", "black" },
	    javascript = { "prettier" },
	format_on_save = {
	    timeout_ms = 500,
	    lsp_format = "fallback",
	  },
  },
  },
	},
	{
    "kylechui/nvim-surround",
    version = "^3.0.0",
    event = "VeryLazy",
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
	},
	{
    "jake-stewart/multicursor.nvim",
    branch = "1.0",
	},
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		opts = {
			bigfile = { enabled = true },
			dashboard = { enabled = true },
			explorer = { enabled = true },
			indent = { enabled = true },
			input = { enabled = true },
			picker = { enabled = true },
			notifier = { enabled = true, timeout=5000 },
			quickfile = { enabled = true },
			cope = { enabled = true },
			scroll = { enabled = true },
			statuscolumn = { enabled = true },
			words = { enabled = true },
		},
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
		}
	}
}
