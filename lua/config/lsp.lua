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
          -- library = vim.api.nvim_get_runtime_file("", true),
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

vim.lsp.enable('lua_ls')
vim.lsp.enable('pyright')
vim.lsp.enable('clangd')
vim.lsp.enable('terraformls')
vim.lsp.enable('slangd')

