return {
	"saghen/blink.cmp",
	opts = {
		completion = {
			accept = { auto_brackets = { enabled = false } },
			documentation = { auto_show = true },
			ghost_text = { enabled = true },
			trigger = { prefetch_on_insert = false }
		},
		fuzzy = {
			implementation = "rust",
			prebuilt_binaries = {
				force_version = "../latest/download" -- 来点魔法
			}
		},
		keymap = { preset = 'enter' },
		signature = { enabled = true },
		sources = {
			default = { "git", "minuet", "lsp", "path", "snippets", "buffer", "ripgrep" },
			providers = {
				minuet = {
					name = 'minuet',
					module = 'minuet.blink',
					async = true,
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
	},
	dependencies = {
		"Kaiser-Yang/blink-cmp-git",
		"mikavilpas/blink-ripgrep.nvim",
		"milanglacier/minuet-ai.nvim",
		"rafamadriz/friendly-snippets",
	}
}
