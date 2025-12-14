return {
    {
        'neovim/nvim-lspconfig'
    },
    {
        -- Requires tree-sitter-cli (https://github.com/tree-sitter/tree-sitter/blob/master/crates/cli/README.md)
        'nvim-treesitter/nvim-treesitter',
        branch = 'main',
        lazy = false,
        build = ":TSUpdate",
        config = function()
            require('nvim-treesitter').install({
                'python',
                'lua',
                'c',
                'cpp',
                'bash'
            })
        end,
    },
    {

        'nvim-telescope/telescope.nvim',
        tag = 'v0.1.9',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {
        'smoka7/hop.nvim',
        version = "*",
        opts = {
            keys = 'etovxqpdygfblzhckisuran'
        }
    },
    {
        'folke/tokyonight.nvim',
        lazy = false,
        priority = 1000,
    },
    {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        dependencies = {
            'rafamadriz/friendly-snippets',
        }
    },
    {
      'hrsh7th/nvim-cmp',
      dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'L3MON4D3/LuaSnip',           -- Add
        'saadparwaiz1/cmp_luasnip',   -- Add
      },
      config = function()
        local cmp = require('cmp')
        local luasnip = require('luasnip')

        -- Load snippet definitions
        require('luasnip.loaders.from_vscode').lazy_load()

        cmp.setup({
          snippet = {
            expand = function(args)
              -- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
              luasnip.lsp_expand(args.body)
            end,
          },
          window = {
            -- completion = cmp.config.window.bordered(),
            -- documentation = cmp.config.window.bordered(),
          },
          mapping = cmp.mapping.preset.insert({
            ['<C-b>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<C-e>'] = cmp.mapping.abort(),
            ['<CR>'] = cmp.mapping.confirm({ select = true }),
          }),
          sources = cmp.config.sources(
              {
                  { name = 'nvim_lsp' },
                  { name = 'luasnip' },
              },
              { { name = 'buffer' } }
          )
        })

        -- Use buffer source for `/` and `?`
        cmp.setup.cmdline({ '/', '?' }, {
          mapping = cmp.mapping.preset.cmdline(),
          sources = {
            { name = 'buffer' }
          }
        })

        -- Use cmdline & path source for ':'
        cmp.setup.cmdline(':', {
          mapping = cmp.mapping.preset.cmdline(),
          sources = cmp.config.sources({
            { name = 'path' }
          }, {
            { name = 'cmdline' }
          }),
          matching = { disallow_symbol_nonprefix_matching = false }
        })

      end,
    },
    {
        "folke/persistence.nvim",
        event = "BufReadPre", -- this will only start session saving when an actual file was opened
        opts = {
            -- add any custom options here
        }
}
}

