vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.signcolumn = 'yes'
vim.opt.clipboard = 'unnamedplus'

vim.cmd.colorscheme('rose-pine')
vim.highlight.priorities.semantic_tokens = 95  -- Treesitter priority is 100, so this makes semantic tokens lower priority

