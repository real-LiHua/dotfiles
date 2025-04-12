---@type fun(icon:string, name:string): fun(_:any, items:table): table
local transform_items = function(icon, name)
	return function(_, items)
		for _, item in ipairs(items) do
			item.kind_icon = icon
			item.kind_name = name
		end
		return items
	end
end

return {
	"saghen/blink.cmp",
	dependencies = {
		"rafamadriz/friendly-snippets",
		"mikavilpas/blink-ripgrep.nvim",
		"Kaiser-Yang/blink-cmp-git",
		"fang2hou/blink-copilot"
	},
	opts = {
		completion = {
			documentation = { auto_show = true },
			ghost_text = { enabled = true }
		},
		signature = { enabled = true },
		fuzzy = { implementation = "prefer_rust" },
		sources = {
			default = { "git", "copilot", "lsp", "path", "snippets", "buffer", "ripgrep" },
			providers = {
				copilot = {
					name = "copilot",
					module = "blink-copilot",
					score_offset = 100,
					async = true,
					transform_items = transform_items("", "Copilot")
				},
				git = {
					module = 'blink-cmp-git',
					name = 'Git'
				},
				ripgrep = {
					module = "blink-ripgrep",
					name = "Ripgrep"
				}
			}
		}
	}
}
