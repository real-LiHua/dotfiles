return {
	"mhartington/formatter.nvim",
	cmd = {"Format", "FormatWrite"},
	event = { "BufReadPre", "InsertEnter" },
	config = function()
		local util = require "formatter.util"
		require("formatter").setup {
			filetype = {
				["*"] = {
					vim.lsp.buf.format
				}
			},
			logging = true,
		}
		vim.api.nvim_create_augroup("__formatter__", { clear = true })
--		vim.api.nvim_create_autocmd("BufWritePost", {
--			group = "__formatter__",
--			command = ":FormatWrite",
--		})
	end,
}
