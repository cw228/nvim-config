-- Remove auto-commenting on new lines. Autocmd is needed if set in an ftplugin.
vim.api.nvim_create_autocmd('FileType', {
    pattern = '*',
    callback = function()
        vim.opt_local.formatoptions:remove({ 'r', 'o' })
    end,
})

vim.api.nvim_create_autocmd('FileType', {
    pattern = {'lua', 'python', 'sh', 'c', 'cpp', 'terraform', 'terraform-vars'},
    callback = function()
        vim.treesitter.start()
    end,
})

-- Change working directory to the directory opened, or if opened a file, to that file's project root.
vim.api.nvim_create_autocmd('VimEnter', {
    callback = function()
        local first_arg = vim.fn.argv(0)
        if first_arg and first_arg ~= '' then
            local path = vim.fn.expand(first_arg --[[@as string]])
            if vim.fn.isdirectory(path) == 1 then
                vim.cmd('cd ' .. path)
            else
                local root = vim.fs.root(0, {'.git'})
                if root then
                    vim.cmd('cd ' .. root)
                else
                    vim.cmd('cd ' .. vim.fn.fnamemodify(path, ':h'))
                end
            end
        end
    end,
})

-- Set background color to none to match terminal (fixes color mismatch around border)
vim.api.nvim_create_autocmd('ColorScheme', {
    callback = function()
        vim.api.nvim_set_hl(0, 'Normal', { bg = 'NONE' })
        vim.api.nvim_set_hl(0, 'NormalNC', { bg = 'NONE' })
        vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'NONE' })
        vim.api.nvim_set_hl(0, 'SignColumn', { bg = 'NONE' })
    end,
})

-- Recession
local resession = require('resession')

-- Automatically save sessions on by working directory on exit
vim.api.nvim_create_autocmd("VimLeavePre", {
    callback = function()
        resession.save(vim.fn.getcwd(), { notify = true })
    end,
})

resession.add_hook("pre_load", function()
    resession.save(vim.fn.getcwd(), { notify = true })
end)

