return {
	"kevinhwang91/nvim-bqf",
	ft = "qf",
	confg = function()
		require("quicker").setup({
		})
	end,
	dependencies = { "nvim-treesitter/nvim-treesitter" }
}
