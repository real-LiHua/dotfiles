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
			accept = { auto_brackets = { enabled = false } },
			documentation = { auto_show = true },
			ghost_text = { enabled = true },
		},
		fuzzy = { implementation = "prefer_rust" },
		keymap = { preset = 'enter' },
		signature = { enabled = true },
		sources = {
			default = { "git", "copilot", "lsp", "path", "snippets", "buffer", "ripgrep" },
			providers = {
				copilot = {
					module = "blink-copilot",
					name = "Copilot",
					score_offset = 100,
					async = true
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
