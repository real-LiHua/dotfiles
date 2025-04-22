return {
	"saghen/blink.cmp",
	opts = {
		completion = {
			accept = { auto_brackets = { enabled = false } },
			documentation = { auto_show = true },
			ghost_text = { enabled = true, show_with_menu = true },
			menu = { auto_show = true },
			trigger = { prefetch_on_insert = false }
		},
		fuzzy = {
			implementation = "rust",
			prebuilt_binaries = {
				-- 来点魔法, blink_cmp 好像没有指定最新版的功能，而且 force_version 似乎必须定义
				-- ~~调用 REST API 获取版本号感觉浪费时间~~, 参考了内部实现
				-- https://github.com/Saghen/blink.cmp/blob/3ce61ae041927082f962791f59e3aadc774b206c/lua/blink/cmp/fuzzy/download/init.lua#L171
				-- 定义 force_version = "../latest/download"
				-- force_version 在内部被赋值给 tag
				-- 原链接 base_url = 'https://github.com/saghen/blink.cmp/releases/download/' .. tag .. '/'
				-- 将变成
				-- => 'https://github.com/saghen/blink.cmp/releases/download/../latest/download/'
				-- => 'https://github.com/saghen/blink.cmp/releases/latest/download/'
				-- 访问后由GitHub 自行重定向
				force_version = "../latest/download"
			}
		},
		keymap = { preset = 'enter' },
		signature = { enabled = true },
		sources = {
			default = { "git", "codecompanion", "minuet", "lsp", "path", "ecolog", "snippets", "buffer", "ripgrep" },
			providers = {
				ecolog = {
					module = "ecolog.integrations.cmp.blink_cmp",
					name = "ecolog",
				},
				git = {
					module = "blink-cmp-git",
					name = "Git"
				},
				minuet = {
					module = "minuet.blink",
					name = "minuet",
					async = true,
					timeout_ms = 3000,
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
		"t3ntxcl3s/ecolog.nvim",
	}
}
