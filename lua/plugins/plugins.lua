return {
    { 'neovim/nvim-lspconfig' },
    {
        -- requires tree-sitter-cli 
        -- https://github. om/tree-sitter/tree-sitter/blob/master/crates/cli/README.md
        'nvim-treesitter/nvim-treesitter',
        branch = 'main',
        lazy = false,
        build = ":TSUpdate",
        config = function()
            local treesitter = require('nvim-treesitter');
            treesitter.install({
                'python',
                'lua',
                'c',
                'cpp',
                'bash',
                'terraform',
                'cmake',
                'slang'
            })

            treesitter.setup({
                indent = {
                    enable = true
                }
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
            -- keys = 'etovxqpdygfblzhckisuran',
            -- keys = 'jkl;cxvqwertyuiopasfd/zm',
            keys = 'asdfjkl;qweruiop',
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
        'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
        },
        config = function()
            local cmp = require('cmp')
            cmp.setup({
                performance = {
                    max_view_entries = 10,
                },
                window = {
                    -- completion = cmp.config.window.bordered(),
                    -- documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),
                    ['<Tab>'] = cmp.mapping.select_next_item(),
                    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
                }),
                sources = cmp.config.sources(
                    {
                        { name = 'nvim_lsp' },
                    },
                    {
                        { name = 'buffer' }
                    },
                    {
                        { name = 'lazydev', group_index = 0 }
                    }
                ),
                matching = {
                  disallow_fuzzy_matching = false,
                  disallow_partial_fuzzy_matching = false,
                  disallow_partial_matching = false,
                  disallow_prefix_unmatched_matching = false,
                  disallow_fullfuzzy_matching = false,
                  disallow_prefix_unmatching = false,
                  disallow_symbol_nonprefix_matching = false,
                },
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
                sources = cmp.config.sources(
                    { { name = 'path' } },
                    { { name = 'cmdline' } }
                ),
                -- matching = { disallow_symbol_nonprefix_matching = false }
            })

        end,
    },
    {
        'stevearc/resession.nvim',
        opts = {},
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
    {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
            library = {
                -- See the configuration section for more details
                -- Load luvit types when the `vim.uv` word is found
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            },
        },
    },
    {
        'stevearc/conform.nvim',
        opts = {
            formatters_by_ft = {
                python = { "black" },
                terraform = { "terraform_fmt" },
                lua = { "stylua" }
            }
        },
    },
    {
        "folke/trouble.nvim",
        opts = {}, -- for default options, refer to the configuration section for custom setup.
        cmd = "Trouble",
    },
}
