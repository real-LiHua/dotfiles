return {
	"olimorris/codecompanion.nvim",
	dir="~/Documents/GitHub/real-LiHua/codecompanion.nvim",	
	dev=true,
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
			end
		},
		strategies = {
			chat = {
				adapter = "openrouter_claude",
				tools = {
					mcp = { callback = function() return require("mcphub.extensions.codecompanion") end },
				}
			},
			inline = {
				adapter = "copilot",
			},
			cmd = {
				adapter = "copilot",
			}
		},
	},
}
