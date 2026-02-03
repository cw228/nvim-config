vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.signcolumn = 'yes'
vim.wo.signcolumn = 'yes'
vim.opt.autoread = true
vim.opt.splitright = true
vim.opt.wrap = false
vim.opt.cmdheight = 1
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.scrolloff = 8
vim.opt.report = 9999
vim.opt.cinoptions:append('L0')
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.smartindent = true

vim.g.nord_italic = false
vim.g.nord_bold = false
vim.cmd.colorscheme('nord')
vim.highlight.priorities.semantic_tokens = 95

vim.g.netrw_banner = 0
