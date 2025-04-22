return {
	"milanglacier/minuet-ai.nvim",
	config = function()
		require("minuet").setup {
			provider = "openai_compatible",
			provider_options = {
				openai_compatible = {
					model = "google/gemini-2.0-flash-exp:free",
					stream = true,
				}
			}
		}
	end,
	dependencies = {
		"nvim-lua/plenary.nvim",
	}
}
