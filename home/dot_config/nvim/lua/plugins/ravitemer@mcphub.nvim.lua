return {
	"ravitemer/mcphub.nvim",
	cmd = "MCPHub",
	build = "bundled_build.lua",
	opts = {
		use_bundled_binary = true,
		auto_toggle_mcp_servers = true,
		make_vars = true,
	},
}
