local capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.lsp.config('lua_ls', {
    capabilities = capabilities,
    settings = {
      Lua = {
        runtime = {
          version = 'LuaJIT',
        },
        diagnostics = {
          globals = { 'vim' },
        },
        workspace = {
          checkThirdParty = false,
          ignoreDir = { '.git', 'node_modules' }
        },
        telemetry = {
          enable = false,
        },
      },
    },
})
vim.lsp.config('pyright', { capabilities = capabilities })
vim.lsp.config('clangd', {
    capabilities = capabilities,
    cmd = {
        "clangd",
        "--function-arg-placeholders=0",
        "--header-insertion=never"
    },
})
vim.lsp.config('terraformls', { capabilities = capabilities })
vim.lsp.config('slangd', { capabilities = capabilities })

vim.lsp.enable('lua_ls')
vim.lsp.enable('pyright')
vim.lsp.enable('clangd')
vim.lsp.enable('terraformls')
vim.lsp.enable('slangd')

-- Filter out diagnostics from files outside the current project root
local orig_handler = vim.lsp.handlers["textDocument/publishDiagnostics"]
vim.lsp.handlers["textDocument/publishDiagnostics"] = function(err, result, ctx, config)
    if result and result.uri then
        local path = vim.uri_to_fname(result.uri)
        if not vim.startswith(path, vim.fn.getcwd()) then
            result.diagnostics = {}
        end
    end
    return orig_handler(err, result, ctx, config)
end

