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
			clangd = function()
				require("lspconfig").clangd.setup({
					cmd = { "/opt/clion/bin/clang/linux/x64/bin/clangd" },
				})
			end,
		},
	},
	dependencies = {
		"mason-org/mason.nvim",
		"neovim/nvim-lspconfig",
	},
}
