return {
	"mfussenegger/nvim-lint",
	event = "LazyFile",
	config = function()
		vim.api.nvim_create_autocmd({ "BufWritePost" }, {
			callback = function()
				require("lint").try_lint()
			end,
		})
		vim.diagnostic.config({
			virtual_text = true,
		})
	end,
}
