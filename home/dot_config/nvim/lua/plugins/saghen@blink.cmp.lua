return {
	'saghen/blink.cmp',
	dependencies = { 'rafamadriz/friendly-snippets' },
	opts = {
		completion = {
			documentation = { auto_show = true },
			ghost_text = { enabled = true }
		},
		signature = { enabled = true },
		fuzzy = { implementation = "prefer_rust" }
	}
}
