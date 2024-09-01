return {
	"mhartington/formatter.nvim",
	lazy=false,
	config = function()
		local fmt
		for _, v in pairs(require("formatter.filetypes")[vim.bo.filetype] or {}) do
			if io.popen("command -v " .. v().exe .. " 2>/dev/null"):close() then
				fmt = v
				break
			end
		end
		require("formatter").setup({
			logging = true,
			filetype = {
				["*"] = {
					require("formatter.filetypes.any").remove_trailing_whitespace,
					fmt,
				},
			},
		})
		vim.api.nvim_create_autocmd({ "BufWritePost" }, { command = ":FormatWrite" })
	end,
}
