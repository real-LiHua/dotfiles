return {
    "xvzc/chezmoi.nvim",
    lazy = false,
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
