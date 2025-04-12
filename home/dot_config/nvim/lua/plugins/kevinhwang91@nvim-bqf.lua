return {
	"kevinhwang91/nvim-bqf",
	ft = "qf",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	confg = function()
		require("quicker").setup({
		})
	end
}
