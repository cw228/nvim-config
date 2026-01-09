-- Explore
vim.keymap.set('n', '<leader>E', '<cmd>Ex<cr>')

-- Saving, quitting
vim.keymap.set('n', '<leader>fw', '<cmd>w<cr>')
vim.keymap.set('n', '<leader>fa', '<cmd>wa<cr>')
vim.keymap.set('n', '<leader>fq', '<cmd>qa<cr>')
vim.keymap.set('n', '<leader>fd', '<cmd>bd<cr>')
vim.keymap.set('n', '<leader>fp', '<cmd>bp<cr>')
vim.keymap.set('n', '<leader>fn', '<cmd>bn<cr>')
vim.keymap.set('n', '<leader>fh', '<cmd>%bd|e#|bd#<cr>')

-- Commenting
vim.keymap.set('n', '<leader>/', 'gcc', { remap = true })
vim.keymap.set('x', '<leader>/', 'gc', { remap = true })

-- Buffers
vim.keymap.set('n', 'L', '<cmd>bn<cr>')
vim.keymap.set('n', 'H', '<cmd>bp<cr>')

for i = 1, 9 do
    vim.keymap.set('n', '<leader>' .. i, '<cmd>BufferLineGoToBuffer ' .. i .. '<cr>')
end


-- Move between split buffers
vim.keymap.set('n', '<leader>h', '<c-w>h', { remap = true })
vim.keymap.set('n', '<leader>l', '<c-w>l', { remap = true })

vim.keymap.set('n', '<leader>vh', '<c-w>h', { remap = true })
vim.keymap.set('n', '<leader>vj', '<c-w>j', { remap = true })
vim.keymap.set('n', '<leader>vk', '<c-w>k', { remap = true })
vim.keymap.set('n', '<leader>vl', '<c-w>l', { remap = true })

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
vim.keymap.set('n', '<leader>r', telescope.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>t', telescope.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>s', '<cmd>Telescope resession<cr>', { desc = 'Telescope find sessions' })

-- Hop
local hop = require('hop')
local directions = require('hop.hint').HintDirection
local positions = require('hop.hint').HintPosition

vim.keymap.set('', '<leader>w', function() hop.hint_words({ direction = directions.AFTER_CURSOR }) end)
vim.keymap.set('', '<leader>b', function() hop.hint_words({ direction = directions.BEFORE_CURSOR }) end)
vim.keymap.set('', '<leader>j', function() hop.hint_vertical({ direction = directions.AFTER_CURSOR }) end)
vim.keymap.set('', '<leader>k', function() hop.hint_vertical({ direction = directions.BEFORE_CURSOR }) end)
vim.keymap.set('', '<leader>e', function() hop.hint_words({
        direction = directions.AFTER_CURSOR,
        hint_position = positions.END
    })
end)
vim.keymap.set('', '<leader>B', function() hop.hint_words({
        direction = directions.BEFORE_CURSOR,
        hint_position = positions.END
    })
end)

-- Luasnip
local luasnip = require('luasnip')

vim.keymap.set({'i', 's'}, '<Tab>', function()
  if luasnip.expand_or_jumpable() then
    luasnip.expand_or_jump()
  else
    return '<Tab>'
  end
end, { expr = true })

vim.keymap.set({'i', 's'}, '<S-Tab>', function()
  if luasnip.jumpable(-1) then
    luasnip.jump(-1)
  else
    return '<S-Tab>'
  end
end, { expr = true })

-- Lazy
vim.keymap.set('n', '<leader>L', '<cmd>Lazy<cr>', { desc = 'Lazy menu' })

-- Neotree
vim.keymap.set('n', '<leader>x', function()
    vim.cmd('Neotree toggle right dir=' .. vim.fn.getcwd())
end, { desc = 'Toggle Neotree' })

