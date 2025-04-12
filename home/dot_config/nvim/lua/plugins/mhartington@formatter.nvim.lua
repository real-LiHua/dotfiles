return {
	"mhartington/formatter.nvim",
	event = { "BufReadPre", "InsertEnter" },
	config = function()
		require("formatter").setup({
			logging = true,
			filetype = {
				["*"] = {
					vim.lsp.buf.format
				}
			},
		})
		vim.api.nvim_create_augroup("__formatter__", { clear = true })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = "__formatter__",
			command = ":FormatWrite",
		})
	end
}
