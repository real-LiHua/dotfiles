return {
	"lewis6991/gitsigns.nvim",
	cmd = "Gitsigns",
	cond = function(_)
		for dir in vim.fs.parents(vim.api.nvim_buf_get_name(0)) do
			if vim.fn.isdirectory(dir .. '/.git') == 1 then
				return true
			end
		end
	end,
	event = "BufReadPost",
	opts = {
		current_line_blame = true
	}
}
