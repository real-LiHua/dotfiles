return {
	"xvzc/chezmoi.nvim",
	event = { "BufWritePost" },
	dependencies = { "nvim-lua/plenary.nvim" },
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
	}
}
