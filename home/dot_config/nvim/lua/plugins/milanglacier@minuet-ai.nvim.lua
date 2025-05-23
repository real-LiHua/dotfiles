return {
	"milanglacier/minuet-ai.nvim",
	init = function()
		require("config.envs")
	end,
	opts = {
		provider = "openai_compatible",
		provider_options = {
			openai_compatible = {
				model = "google/gemini-2.0-flash-exp:free",
				stream = true,
			},
		},
	},
}
