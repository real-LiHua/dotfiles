return {
	"williamboman/mason-lspconfig.nvim",
	event = { "BufNewFile", "BufReadPre" },
	dependencies = {
		"williamboman/mason.nvim",
		"saghen/blink.cmp",
		"neovim/nvim-lspconfig"
	},
	opts = {
		automatic_installation = true,
		handlers = {
			function(server_name)
				require("lspconfig")[server_name].setup {
					capabilities = require('blink.cmp').get_lsp_capabilities()
				}
			end,
		},
	},
}
