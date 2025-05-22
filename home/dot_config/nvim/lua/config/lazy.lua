local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
	local lazyrepo = "ssh://git@ssh.github.com:443/folke/lazy.nvim"
	local out =
		vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out,                            "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
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
				"man",
				"tutor",
			}
		}
	},
	spec = { { import = "plugins" } },
})
