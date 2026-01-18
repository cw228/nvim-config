vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.signcolumn = 'yes'
vim.wo.signcolumn = 'yes'
vim.opt.autoread = true
vim.opt.splitright = true
vim.opt.wrap = false
vim.opt.cmdheight = 0

vim.g.nord_italic = false
vim.g.nord_bold = false

vim.cmd.colorscheme('nord')
vim.highlight.priorities.semantic_tokens = 95

vim.g.netrw_banner = 0

vim.opt.fillchars:append({
    vert = "⎸"
})

