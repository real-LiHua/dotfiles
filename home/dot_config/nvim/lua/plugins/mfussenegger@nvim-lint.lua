return {
	"mfussenegger/nvim-lint",
	config = function()
		vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
			callback = function()
				require("lint").try_lint()
			end,
		})
		vim.diagnostic.config({
			virtual_text = true,
		})
	end,
}
