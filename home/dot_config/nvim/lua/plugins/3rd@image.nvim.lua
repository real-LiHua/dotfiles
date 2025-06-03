return {
	"3rd/image.nvim",
	ft = {
		"avif",
		"jpeg",
		"jpg",
		"png",
		"gif",
		"markdown",
		"norg",
		"typst",
		"vimwiki",
		"webp",
	},
	build = false,
	opts = {
		processor = "magick_cli",
		integrations = {
			markdown = {
				floating_windows = true,
				only_render_image_at_cursor = true,
			},
			html = {
				enabled = true,
			},
			css = {
				enabled = true,
			},
		},
	},
}
