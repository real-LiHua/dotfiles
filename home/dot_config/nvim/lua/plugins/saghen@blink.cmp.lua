return {
	"saghen/blink.cmp",
	event = "InsertEnter",
	opts = {
		appearance = {
			kind_icons = {
				claude = '󰋦',
				openai = '󱢆',
				codestral = '󱎥',
				gemini = '',
				Groq = '',
				Openrouter = '󱂇',
				Ollama = '󰳆',
				['Llama.cpp'] = '󰳆',
				Deepseek = ''
			}
		},
		completion = {
			documentation = { auto_show = true },
			ghost_text = { enabled = true, show_with_menu = true },
			menu = {
				draw = {
					columns = { { "kind_icon" }, { "label", gap = 1 } },
					components = {
						label = {
							text = function(ctx)
								return require("colorful-menu").blink_components_text(ctx)
							end,
							highlight = function(ctx)
								return require("colorful-menu").blink_components_highlight(ctx)
							end,
						},
						kind_icon = {
							text = function(ctx)
								local icon = ctx.kind_icon
								if vim.tbl_contains({ "Path" }, ctx.source_name) then
									local dev_icon, _ = require("nvim-web-devicons").get_icon(ctx.label)
									if dev_icon then
										icon = dev_icon
									end
								else
									local lspkind_icon = require("lspkind").symbolic(ctx.kind, nil)
									if lspkind_icon ~= "" then
										icon = lspkind_icon
									end
								end

								return icon .. ctx.icon_gap
							end,
							highlight = function(ctx)
								local hl = ctx.kind_hl
								if vim.tbl_contains({ "Path" }, ctx.source_name) then
									local dev_icon, dev_hl = require("nvim-web-devicons").get_icon(ctx.label)
									if dev_icon then
										hl = dev_hl
									end
								end
								return hl
							end,
						},
					},
				},
			},
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
			default = { "ecolog", "git", "lsp", "path", "snippets", "buffer", "ripgrep", "codecompanion" },
			providers = {
				ecolog = {
					module = "ecolog.integrations.cmp.blink_cmp",
					name = "Ecolog",
				},
				git = {
					module = "blink-cmp-git",
					name = "Git"
				},
				minuet = {
					module = "minuet.blink",
					name = "Minuet",
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
			"olimorris/codecompanion.nvim",
			"rafamadriz/friendly-snippets",
	}
}
-- vim: set ts=2:
