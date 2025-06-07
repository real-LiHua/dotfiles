return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	event = { "BufEnter", "BufAdd", "BufNew", "BufNewFile", "BufWinEnter" },
	cmd = {
		"TSLog",
		"TSInstall",
		"TSInstallFromGrammar",
		"TSUninstall",
		"TSUpdate",
	},
	build = ":TSUpdate",
}
