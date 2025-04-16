return {
	"ravitemer/mcphub.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"olimorris/codecompanion.nvim"
	},
	cmd = "MCPHub",
	build = "bundled_build.lua",
	opts = {
		use_bundled_binary = true,
		extensions = {
			codecompanion = {
				show_result_in_chat = true,
				make_vars = true,
				make_slash_commands = true,
			},
		}
	}
}
