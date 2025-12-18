-- Saving, quitting
vim.keymap.set({'n', 'x'}, '<leader>w', '<cmd>w<cr>')
vim.keymap.set({'n', 'x'}, '<leader>W', '<cmd>w<cr>')
vim.keymap.set({'n', 'x'}, '<leader>q', '<cmd>q<cr>')
vim.keymap.set({'n', 'x'}, '<leader>Q', '<cmd>qa<cr>')

-- Navigation
vim.keymap.set({'n', 'x'}, '<leader>E', '<cmd>Ex<cr>')

-- Commenting
vim.keymap.set('n', '<leader>/', 'gcc', { remap = true })
vim.keymap.set('x', '<leader>/', 'gc', { remap = true })

-- Move between split buffers
vim.keymap.set('n', '<leader>h', '<c-w>h', { remap = true })
vim.keymap.set('n', '<leader>j', '<c-w>j', { remap = true })
vim.keymap.set('n', '<leader>k', '<c-w>k', { remap = true })
vim.keymap.set('n', '<leader>l', '<c-w>l', { remap = true })

-- Indent
vim.keymap.set('n', '>', '>>w', { remap = true })
vim.keymap.set('n', '<', '<<^', { remap = true })
vim.keymap.set('x', '>', '>gvw', { remap = true })
vim.keymap.set('x', '<', '<gv^', { remap = true })

-- Search
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- LSP
vim.keymap.set('n', 'gh', vim.diagnostic.open_float)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition)

-- Telescope
local telescope = require('telescope.builtin')

vim.keymap.set('n', '<leader>p', telescope.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>f', telescope.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>s', '<cmd>Telescope resession<cr>', { desc = 'Telescope find sessions' })

-- Hop
local hop = require('hop')
local directions = require('hop.hint').HintDirection

vim.keymap.set('', 'fw', function() hop.hint_words({ direction = directions.AFTER_CURSOR }) end)
vim.keymap.set('', 'fb', function() hop.hint_words({ direction = directions.BEFORE_CURSOR }) end)
vim.keymap.set('', 'fj', function() hop.hint_vertical({ direction = directions.AFTER_CURSOR }) end)
vim.keymap.set('', 'fk', function() hop.hint_vertical({ direction = directions.BEFORE_CURSOR }) end)

-- Resession
-- local resession = require("resession")
-- vim.keymap.set("n", "<leader>ss", resession.save)
-- vim.keymap.set("n", "<leader>sl", resession.load)
-- vim.keymap.set("n", "<leader>sd", resession.delete)


-- Persistence
-- load the session for the current directory
-- vim.keymap.set("n", "<leader>qs", function() require("persistence").load() end)

-- select a session to load
-- vim.keymap.set("n", "<leader>sl", function()
--     require("persistence").select()
-- end)

-- load the last session
-- vim.keymap.set("n", "<leader>ss", function() require("persistence").load({ last = true }) end)

-- stop Persistence => session won't be saved on exit
-- vim.keymap.set("n", "<leader>qd", function() require("persistence").stop() end)

