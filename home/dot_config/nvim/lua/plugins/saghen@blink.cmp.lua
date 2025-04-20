return {
	"saghen/blink.cmp",
	opts = {
		completion = {
			accept = { auto_brackets = { enabled = false } },
			documentation = { auto_show = true },
			ghost_text = { enabled = true },
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
			default = { "git", "avante", "lsp", "path", "snippets", "buffer", "ripgrep" },
			providers = {
				avante = {
					module = 'blink-cmp-avante',
					name = 'Avante'
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
		"Kaiser-Yang/blink-cmp-avante",
		"mikavilpas/blink-ripgrep.nvim",
		"rafamadriz/friendly-snippets",
	}
}
