local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--branch=stable",
		"ssh://git@ssh.github.com:443/folke/lazy.nvim",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
	checker = { enable = true },
	defaults = { lazy = true },
	git = { url_format = "ssh://git@ssh.github.com:443/%s" },
	lockfile = "~/.local/share/chezmoi/lazy-lock.json",
	performance = {
		rtp = {
			disabled_plugins = {
				"editorconfig",
				"man",
				"matchit",
				"tutor",
			},
		},
	},
	spec = { { import = "plugins" } },
})
