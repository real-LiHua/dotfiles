return {
	"olimorris/codecompanion.nvim",
	opts = {
		strategies = {
			chat = {
				adapter = "copilot",
				tools = {
					["mcp"] = {
						callback = function() return require("mcphub.extensions.codecompanion") end,
						description = "Call tools and resources from the MCP Servers",
					}
				}
			},
			inline = {
				adapter = "copilot",
			},
			cmd = {
				adapter = "copilot",
			}
		}
	},
}
