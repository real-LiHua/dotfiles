return {
	"mhartington/formatter.nvim",
	lazy = false,
	config = function()
		require("formatter").setup({
			logging = true,
			filetype = {
				["*"] = {
					vim.lsp.buf.format
				}
			},
		})
		vim.api.nvim_create_autocmd({ "BufWritePost" }, { command = ":FormatWrite" })
	end,
}
