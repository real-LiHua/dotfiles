vim.o.bk = true
vim.o.cuc = true
vim.o.cul = true
vim.o.fdc = "auto"
-- vim.o.fdm = "indent"
vim.o.list = true
vim.o.lcs = "space:·,tab:<->"
vim.o.ic = true
vim.o.nu = true
vim.o.rnu = true
vim.o.sh = "/usr/bin/zsh"
vim.o.so = 5
vim.o.si = true
vim.o.sm = true
vim.o.sw = 4
vim.o.wic = true
vim.g.load_netrw = 1
vim.g.load_netrwPlugin = 1
vim.o.termguicolors = true
vim.cmd([[colorscheme slate]])
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")
			configs.setup({
				auto_install = true,
				highlight = { enable = true },
				indent = { enable = true },
				disable = function(lang, buf)
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
	{ "neovim/nvim-lspconfig" },
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
	},
	{
		"mhartington/formatter.nvim",
		event = { "InsertEnter" },
		config = function()
			local util = require("formatter.util")
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
			vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
				pattern = { os.getenv("HOME") .. "/.local/share/chezmoi/*" },
				callback = function()
					vim.schedule(require("chezmoi.commands.__edit").watch)
				end,
			})
		end,
	},
}, {
	defaults = { lazy = true },
	checker = { enable = true },
})
