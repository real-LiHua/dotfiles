return {
	'milanglacier/minuet-ai.nvim',
	config = function()
		require('minuet').setup {
		}
	end,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"philosofonusus/ecolog.nvim",
		"Saghen/blink.cmp",
	}
}
