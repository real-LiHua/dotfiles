return {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	cmd = {
		"MasonToolsInstall",
		"MasonToolsUpdate",
		"MasonToolsClean",
	},
	opts = {
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
	},
}
