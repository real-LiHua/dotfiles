return {
	"williamboman/mason-lspconfig.nvim",
	lazy=false,
	--event = { "BufNewFile", "BufReadPre" },
	opts = {
		automatic_installation = true,
		ensure_installed = {
			"basedpyright",
			"clangd",
			"cssls",
			"docker_compose_language_service",
			"gh_actions_ls",
			"gopls",
			"html",
			"jsonls",
			"lemminx",
			"lua_ls",
			"mutt_ls",
			"rust_analyzer",
			"systemd_ls",
			"vue_ls",
			"yamlls",
		},
		handlers = {
			function(server_name)
				require("lspconfig")[server_name].setup {
					capabilities = require('blink.cmp').get_lsp_capabilities()
				}
			end,
		},
	},
}
