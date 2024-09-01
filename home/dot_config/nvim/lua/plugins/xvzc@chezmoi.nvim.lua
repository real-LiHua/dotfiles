return {
		"xvzc/chezmoi.nvim",
		lazy = false,
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("chezmoi").setup({
				edit = {
					watch = true,
				},
				notification = {
					on_watch = true,
				},
				telescope = {
					select = { "<CR>" },
				},
			})
		end,
	}
