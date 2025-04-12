return {
	"mhartington/formatter.nvim",
	event = { "BufReadPre", "InsertEnter" },
	opts = {
		logging = true,
		filetype = {
			["*"] = {
				vim.lsp.buf.format
			}
		},
	}
}
