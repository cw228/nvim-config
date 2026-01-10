return {
    {
        'neovim/nvim-lspconfig'
    },
    {
        'ray-x/lsp_signature.nvim',
        event = 'LspAttach',
        opts = {
            bind = true,
            floating_window = true,
            hint_enable = false, -- disable virtual text hints
            handler_opts = {
                border = 'rounded'
            },
            toggle_key = '<C-s>', -- toggle signature help with Ctrl-S if needed
        },
    },
    {
        -- Requires tree-sitter-cli 
        -- https://github.com/tree-sitter/tree-sitter/blob/master/crates/cli/README.md
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
                'bash',
                'terraform',
                'cmake'
            })
        end,
    },
    {

        'nvim-telescope/telescope.nvim',
        tag = 'v0.1.9',
        dependencies = { 'nvim-lua/plenary.nvim', 'scottmckendry/pick-resession.nvim' },
        config = function ()
            local telescope = require('telescope')
            local actions = require('telescope.actions')
            telescope.setup({
                defaults = {
                    file_ignore_patterns = { "^.git/", "^./.git/" }, -- always ignore .git
                    mappings = {
                        i = {
                            ["<esc>"] = actions.close
                        }
                    }
                },
                pickers = {
                    find_files = {
                        hidden = true -- but show other hidden files
                    }
                },
                extensions = {
                    resession = {
                        prompt_title = "Find Sessions", -- telescope prompt title
                        dir = "session" -- directory where resession stores sessions
                    },
                }
            })
        end
    },
    {
        'smoka7/hop.nvim',
        version = "*",
        opts = {
            keys = 'etovxqpdygfblzhckisuran',
            teasing = false
        }
    },
    {
        'folke/tokyonight.nvim',
        name = 'tokyonight',
        lazy = true,
        priority = 1000,
    },
    {
        'rose-pine/neovim',
        name = 'rose-pine',
        lazy = true,
		priority = 1000,
        opts = {
            styles = {
                bold = false,
                italic = false
            },
        }
    },
    { 'datsfilipe/vesper.nvim' },
    { 'shaunsingh/nord.nvim' },
	{
		'rebelot/kanagawa.nvim',
        name = 'kanagawa',
		lazy = true,
		priority = 1000,
	},
    {
        'L3MON4D3/LuaSnip',
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
        'stevearc/resession.nvim',
        opts = {},
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = {
            options = {
                theme = 'nord'
            },
            sections = {
                lualine_a = {},
                lualine_b = {'branch', 'diff', 'diagnostics'},
                lualine_c = {},
                lualine_x = {},
                lualine_y = { {'filename', path = 3} },
                lualine_z = {'location'}
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {'filename'},
                lualine_x = {'location'},
                lualine_y = {},
                lualine_z = {}
            },
            tabline = {},
            winbar = {},
            inactive_winbar = {},
            extensions = {}
        }
    },
    {
        "kdheepak/lazygit.nvim",
        lazy = true,
        cmd = {
            "LazyGit",
            "LazyGitConfig",
            "LazyGitCurrentFile",
            "LazyGitFilter",
            "LazyGitFilterCurrentFile",
        },
        -- optional for floating window border decoration
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        -- setting the keybinding for LazyGit with 'keys' is recommended in
        -- order to load thegg plugin when the command is run for the first time
        keys = {
            { "<leader>g", "<cmd>LazyGit<cr>", desc = "LazyGit" }
        }
    },
    { 'nvim-mini/mini.pairs', version = false, opts = {} },
    { 'nvim-mini/mini.surround', version = false, opts = {} },
    { 'karb94/neoscroll.nvim', opts = { easing = 'cubic', duration_multiplier = 0.5 } },
    {
        'nvim-neo-tree/neo-tree.nvim',
        branch = 'v3.x',
        dependencies = {
          'nvim-lua/plenary.nvim',
          'MunifTanjim/nui.nvim',
          'nvim-tree/nvim-web-devicons', -- optional, but recommended
        },
        lazy = false, -- neo-tree will lazily load itself
        opts = {
            filesystem = {
                hijack_netrw_behavior = "disabled"
            }
        }
    },
    -- {
    --     'akinsho/bufferline.nvim',
    --     version = "*",
    --     dependencies = 'nvim-tree/nvim-web-devicons',
    --     config = function()
    --         local bufferline = require('bufferline')
    --         bufferline.setup({
    --             options = {
    --                 style_preset = bufferline.style_preset.no_italic,
    --             },
    --         })
    --     end
    -- }
}

