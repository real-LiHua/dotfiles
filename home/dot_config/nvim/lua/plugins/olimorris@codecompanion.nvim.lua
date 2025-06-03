return {
	"olimorris/codecompanion.nvim",
	cmd = { "CodeCompanion", "CodeCompanionActions", "CodeCompanionCmd", "CodeCompanionChat" },
	opts = {
		adapters = {
			openrouter_claude = function()
				require("config.envs")
				return require("codecompanion.adapters").extend("openai_compatible", {
					env = {
						url = "https://openrouter.ai/api",
						api_key = "OPENROUTER_API_KEY",
						chat_url = "/v1/chat/completions",
					},
					schema = {
						model = {
							default = "google/gemini-2.0-flash-exp:free",
						},
					},
				})
			end,
		},
		extensions = {
			mcphub = {
				callback = "mcphub.extensions.codecompanion",
				opts = {
					make_slash_commands = true,
					make_vars = true,
					show_result_in_chat = false,
				},
			},
		},
		strategies = {
			chat = {
				adapter = "gemini",
			},
			inline = {
				adapter = "copilot",
			},
			cmd = {
				adapter = "copilot",
			},
		},
	},
}
