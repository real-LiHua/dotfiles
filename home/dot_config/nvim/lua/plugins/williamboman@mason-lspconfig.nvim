return {
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
	}
