return {
	"williamboman/mason-lspconfig.nvim",
	opts = {
		handlers = {
			function(server_name)
				vim.lsp.config(server_name, {
					capabilities = require('blink.cmp').get_lsp_capabilities()
				})
			end,
		},
	},
}
