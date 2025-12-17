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
          library = vim.api.nvim_get_runtime_file("", true),
          checkThirdParty = false,
        },
        telemetry = {
          enable = false,
        },
      },
    },
})

vim.lsp.config('pyright', {
    capabilities = capabilities,
})

vim.lsp.config('terraform-ls', {
    capabilities = capabilities,
    -- on_attach = function (client, _)
    --     client.server_capabilities.semanticTokensProvider = nil
    -- end
})

vim.lsp.enable('lua_ls')
vim.lsp.enable('pyright')
vim.lsp.enable('clangd')
vim.lsp.enable('terraformls')

