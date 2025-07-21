return {
	"yetone/avante.nvim",
	build = "make",
	cmd = {
		"AvanteAsk",
		"AvanteBuild",
		"AvanteChat",
		"AvanteChatNew",
		"AvanteHistory",
		"AvanteClear",
		"AvanteEdit",
		"AvanteFocus",
		"AvanteRefresh",
		"AvanteStop",
		"AvanteSwitchProvider",
		"AvanteShowRepoMap",
		"AvanteToggle",
		"AvanteModels",
		"AvanteSwitchSelectorProvider",
	},
	opts = {
		web_search_engine = {
			provider = "searxng",
		},
		provider = "gemini",
		system_prompt = function()
			local hub = require("mcphub").get_hub_instance()
			return hub and hub:get_active_servers_prompt() or ""
		end,
		windows = {
			position = "left",
			width = 42,
			sidebar_header = {
				enabled = false,
			},
			ask = {
				floating = true,
			},
		},
		selector = {
			provider = "fzf_lua",
		},
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
		custom_tools = function()
			return {
				require("mcphub.extensions.avante").mcp_tool(),
			}
		end,
	},
}
