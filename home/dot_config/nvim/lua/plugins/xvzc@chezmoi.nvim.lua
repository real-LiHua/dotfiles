return {
	"xvzc/chezmoi.nvim",
	event = { "BufWritePost" },
	opts = {
		edit = {
			watch = true,
		},
		notification = {
			on_watch = true,
		},
		telescope = {
			select = { "<CR>" },
		},
	},
	dependencies = { "nvim-lua/plenary.nvim" }
}
