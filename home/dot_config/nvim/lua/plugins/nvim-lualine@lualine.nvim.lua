return {
	'nvim-lualine/lualine.nvim',
	lazy = false,
	config = function()
		require("lualine").setup({
			theme = 'jellybeans',
			sections = {
				lualine_x = {
					{ require('mcphub.extensions.lualine') },
				},
			}
		})
	end,
}
