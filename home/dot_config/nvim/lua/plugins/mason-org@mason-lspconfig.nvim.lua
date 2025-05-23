return {
	"mason-org/mason-lspconfig.nvim",
	event = "InsertEnter",
	opts = {
		handlers = {
			function(server_name)
				vim.lsp.config(server_name, {
					capabilities = require("blink.cmp").get_lsp_capabilities(),
				})
			end,
		},
	},
	dependencies = {
		"mason-org/mason.nvim",
		"neovim/nvim-lspconfig",
	},
}
