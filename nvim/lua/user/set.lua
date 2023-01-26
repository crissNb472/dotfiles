-- neovim optimizations
require("impatient")

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.smartindent = true

vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.ignorecase = true
vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

vim.opt.updatetime = 100

vim.opt.termguicolors = true
vim.opt.cmdheight = 1

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.foldmethod = "expr"

vim.opt.colorcolumn = "80"

-- mouse support
vim.api.nvim_set_option("mouse", "a")
vim.cmd "set noshowmode"

vim.cmd([[
let g:OmniSharp_server_use_mono = 1
]])
vim.cmd([[
let g:OmniSharp_server_use_net6 = 0
]])
vim.cmd([[
let g:ale_linters = {
\ 'cs': ['OmniSharp']
\}
]])
