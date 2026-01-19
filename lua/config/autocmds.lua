-- Remove auto-commenting on new lines. Autocmd is needed if set in an ftplugin.
vim.api.nvim_create_autocmd('FileType', {
    pattern = '*',
    callback = function()
        vim.opt_local.formatoptions:remove({ 'r', 'o' })
    end,
})

vim.api.nvim_create_autocmd('FileType', {
    pattern = {'lua', 'python', 'sh', 'c', 'cpp', 'terraform', 'terraform-vars', 'cmake'},
    callback = function()
        vim.treesitter.start()
    end,
})

-- Change working directory to the directory opened, or if opened a file, to that file's project root.
vim.api.nvim_create_autocmd('VimEnter', {
    callback = function()
        local chdir = function(path)
            vim.cmd('cd ' .. path)
        end

        local load_session = function(session)
            local success, _ = pcall(require('resession').load, session)
            if not success then
                vim.cmd('Neotree show current')
            end
        end

        local first_arg = vim.fn.argv(0)
        if first_arg and first_arg ~= '' then
            local path = vim.fn.expand(first_arg --[[@as string]])
            if vim.fn.isdirectory(path) == 1 then
                chdir(path)
                load_session(vim.fn.getcwd())
            else
                local root = vim.fs.root(0, {'.git'})
                if root then
                    chdir(root)
                else
                    chdir(vim.fn.fnamemodify(path, ':h'))
                end
            end
        else
            load_session('last')
        end
    end,
})

-- Set background color to none to match terminal (fixes color mismatch around border)
vim.api.nvim_create_autocmd('ColorScheme', {
    callback = function()
        -- local ll_theme = require('lualine.themes.nord')

        vim.api.nvim_set_hl(0, 'Normal', { bg = 'NONE' })
        vim.api.nvim_set_hl(0, 'SignColumn', { bg = 'NONE' })
        -- vim.api.nvim_set_hl(0, 'StatusLine', {
        --     bg = ll_theme.normal.c.bg
        -- })
        -- vim.api.nvim_set_hl(0, 'StatusLineNC', {
        --     bg = ll_theme.normal.b.bg
        -- })
        vim.api.nvim_set_hl(0, 'DiagnosticUnnecessary', {})
        -- vim.api.nvim_set_hl(0, 'MsgArea', { bg = ll_theme.normal.c.bg, fg = ll_theme.normal.c.fg })
        -- vim.api.nvim_set_hl(0, 'WinSeparator', {
        --     bg = 'NONE',
        --     fg = ll_theme.normal.b.bg
        -- })
    end
})

-- Resession
local resession = require('resession')

-- Automatically save sessions by working directory on exit
vim.api.nvim_create_autocmd('VimLeavePre', {
    callback = function()
        -- Close Neotree before saving session - it causes issues
        vim.cmd('Neotree close')
        resession.save(vim.fn.getcwd(), { notify = false })
        resession.save('last', { notify = false })
    end,
})

-- Save the session when switching to a different session
resession.add_hook('pre_load', function()
    vim.cmd('Neotree close')
    resession.save(vim.fn.getcwd(), { notify = false })
end)

resession.add_hook('post_load', function()
    local has_real_buffer = false
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        if vim.bo[buf].buflisted then
            local bufname = vim.api.nvim_buf_get_name(buf)
            if bufname ~= '' and vim.fn.isdirectory(bufname) == 0 then
                has_real_buffer = true
                break
            end
        end
    end

    if not has_real_buffer then
        vim.cmd('Neotree show current')
    end
end)

