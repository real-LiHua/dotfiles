return {
	"yetone/avante.nvim",
	opts = {
		system_prompt = function()
			return require("mcphub").get_hub_instance():get_active_servers_prompt()
		end,
		custom_tools = function()
			return require("mcphub.extensions.avante").mcp_tool()
		end,
		disabled_tools = {
			"list_files",
			"search_files",
			"read_file",
			"create_file",
			"rename_file",
			"delete_file",
			"create_dir",
			"rename_dir",
			"delete_dir",
			"bash",
		},
	},
	build = "make",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
		"nvim-tree/nvim-web-devicons",
		"nvim-treesitter/nvim-treesitter",
		"ravitemer/mcphub.nvim",
		"stevearc/dressing.nvim",
	},
}
