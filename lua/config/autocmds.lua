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
            require('resession').load(session, { silence_errors = true })
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
        vim.api.nvim_set_hl(0, 'Normal', { bg = 'NONE' })
        vim.api.nvim_set_hl(0, 'NormalNC', { bg = 'NONE' })
        vim.api.nvim_set_hl(0, 'SignColumn', { bg = 'NONE' })

        -- local float_color = '#1F1E27'
        local float_color = '#292833'

        vim.api.nvim_set_hl(0, 'NormalFloat', { bg = float_color })
        vim.api.nvim_set_hl(0, 'FloatBorder', { bg = float_color })
        vim.api.nvim_set_hl(0, 'TelescopeBorder', { bg = float_color })
    end,
})

-- Recession
local resession = require('resession')

-- Automatically save sessions on by working directory on exit
vim.api.nvim_create_autocmd("VimLeavePre", {
    callback = function()
        resession.save(vim.fn.getcwd(), { notify = false })
        resession.save('last', { notify = false })
    end,
})

resession.add_hook("pre_load", function()
    resession.save(vim.fn.getcwd(), { notify = false })
end)

