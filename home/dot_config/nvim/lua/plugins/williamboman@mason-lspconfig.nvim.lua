return {
	"williamboman/mason-lspconfig.nvim",
	event = { "BufNewFile", "BufReadPre" },
	dependencies = {
		"williamboman/mason.nvim",
		"hrsh7th/nvim-cmp",
		"neovim/nvim-lspconfig"
	},
	opts = {
		automatic_installation = true,
		handlers = {
			function(server_name)
				require("lspconfig")[server_name].setup {
					capabilities = require('cmp_nvim_lsp').default_capabilities()
				}
			end,
		},
	},
}
