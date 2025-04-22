return {
	"olimorris/codecompanion.nvim",
	config = function()
		local adapters = require("codecompanion.adapters")
		local adapter = function(m, o)
			return function()
				return adapters(m, o)
			end
		end
		require("codecompanion").setup({
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
		})
	end,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"ravitemer/mcphub.nvim"
	}
}
