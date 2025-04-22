return {
	"williamboman/mason-lspconfig.nvim",
	event = { "BufNewFile", "BufReadPre" },
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
