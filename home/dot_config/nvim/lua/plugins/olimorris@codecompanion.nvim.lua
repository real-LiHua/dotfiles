return {
	"olimorris/codecompanion.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
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
				},
				inline = {
					adapter = "copilot",
				},
				cmd = {
					adapter = "copilot",
				}
			},
			prompt_library = {
				["Generate a Commit Message"] = {
					strategy = "chat",
					description = "Generate a commit message",
					opts = {
						index = 10,
						is_default = true,
						is_slash_cmd = true,
						short_name = "commit",
						auto_submit = true,
					},
					prompts = {
						{
							role = "user",
							content = function()
								return string.format(
									[[You are an expert at following the Conventional Commit specification. Given the git diff listed below, please generate a commit message for me:

```diff
%s
```
]],
									vim.fn.system("git diff --no-ext-diff --staged")
								)
							end,
							opts = {
								contains_code = true,
							}
						} }
				}
			}
		})
	end
}
