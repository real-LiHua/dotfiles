return {
	"pwntester/octo.nvim",
	opts = {
		picker = "fzf-lua",
		picker_config = {
			use_emojis = true,
		},
		ui = { use_signcolumn = true }
	},
	dependencies = {
		"ibhagwan/fzf-lua",
	}
}
