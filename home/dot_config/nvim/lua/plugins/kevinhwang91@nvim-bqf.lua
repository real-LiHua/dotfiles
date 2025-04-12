return {
	"kevinhwang91/nvim-bqf",
	event = "FileType qf",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	confg = function()
		require("quicker").setup({
		})
	end
}
