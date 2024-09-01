return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				auto_install = true,
				highlight = { enable = true },
				indent = { enable = true },
				disable = function(_, buf)
					local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
					return ok and stats and stats.size > 102400
				end,
			})
		end,
	},
	{ "nvim-treesitter/nvim-treesitter-context", lazy = false },
	{ "williamboman/mason.nvim", opts = {} },
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			automatic_installation = true,
			handlers = {
				function(server_name)
					require("lspconfig")[server_name].setup({
						server = { capabilities = require("cmp_nvim_lsp").default_capabilities() },
					})
				end,
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
	},
	{
		"ray-x/lsp_signature.nvim",
		opts = {
			bind = true,
			handler_opts = {
				border = "rounded",
			},
		},
	},
	{
		"hrsh7th/nvim-cmp",
		event = { "InsertEnter", "CmdlineEnter" },
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"windwp/nvim-autopairs",
		},
		config = function()
			local cmp = require("cmp")
			cmp.setup({
				snippet = {
					expand = function(args)
						vim.snippet.expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "nvim_lsp_document_symbol" },
					{ name = "nvim_lsp_signature_help" },
				}, { { name = "buffer" } }),
			})
			cmp.event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done())
		end,
	},
	{
		"mfussenegger/nvim-lint",
		event = { "InsertEnter" },
		config = function()
			vim.api.nvim_create_autocmd({ "BufWritePost" }, {
				callback = require("lint").try_lint,
			})
		end,
	},
	{
		"mhartington/formatter.nvim",
		event = { "InsertEnter" },
		config = function()
			require("formatter").setup({
				logging = true,
				filetype = {
					lua = {
						require("formatter.filetypes.lua").stylua,
					},
					["*"] = {
						require("formatter.filetypes.any").remove_trailing_whitespace,
					},
				},
			})
			vim.api.nvim_create_autocmd({ "BufWritePost" }, { command = ":FormatWrite" })
		end,
	},
	{ "mfussenegger/nvim-dap" },
	{ "jay-babu/mason-nvim-dap.nvim", lazy = false, opts = {} },
	{ "WhoIsSethDaniel/mason-tool-installer.nvim", event = { "BufReadPre", "BufNewFile" } },
	{
		"xvzc/chezmoi.nvim",
		lazy = false,
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("chezmoi").setup({
				edit = {
					watch = true,
				},
				notification = {
					on_watch = true,
				},
				telescope = {
					select = { "<CR>" },
				},
			})
		end,
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		lazy = false,
		opts = {},
	},
	{ "lewis6991/gitsigns.nvim", opts = {} },
}
