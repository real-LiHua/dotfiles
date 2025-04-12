return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	event = "InsertEnter",
	server = { type = "binary" },
	config = function()
		vim.api.nvim_create_autocmd("User", {
			pattern = "BlinkCmpMenuOpen",
			callback = function()
				vim.b.copilot_suggestion_hidden = true
			end,
		})
		vim.api.nvim_create_autocmd("User", {
			pattern = "BlinkCmpMenuClose",
			callback = function()
				vim.b.copilot_suggestion_hidden = false
			end,
		})
	end,
	opts = {
		filetypes = {
			sh = function()
				if string.match(vim.fs.basename(vim.api.nvim_buf_get_name(0)), '^%.env.*') then
					return false
				end
				return true
			end,
		},
	}
}
