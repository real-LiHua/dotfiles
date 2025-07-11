vim.o.bk = true
vim.o.cuc = true
vim.o.cul = true
vim.o.fdc = "auto"
-- vim.o.fdm = "indent"
vim.o.list = true
vim.o.lcs = "space:·,tab:<->"
vim.o.ic = true
vim.o.nu = true
vim.o.rnu = true
vim.o.sh = "/usr/bin/zsh"
vim.o.so = 5
vim.o.si = true
vim.o.sm = true
vim.o.sw = 4
vim.o.wic = true
vim.g.load_netrw = 1
vim.g.load_netrwPlugin = 1
vim.o.termguicolors = true

require("config.lazy")
vim.cmd.colo("slate")
