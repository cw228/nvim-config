# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a Neovim configuration using lazy.nvim as the plugin manager. It targets Neovim 0.10+ and uses the modern `vim.lsp.config()` API.

## Architecture

```
init.lua                    # Entry point - loads modules in order
lua/
├── config/
│   ├── lazy.lua           # Bootstrap lazy.nvim, set leader keys
│   ├── keymaps.lua        # All keybindings
│   ├── autocmds.lua       # Autocommands (session mgmt, treesitter)
│   ├── opts.lua           # Editor options, colorscheme
│   └── lsp.lua            # LSP server configurations
└── plugins/
    └── plugins.lua        # All plugin specs (single file)
```

## Key Configuration Details

**Leader key:** `<Space>`

**LSP servers configured:** lua_ls, pyright, clangd, terraformls, slangd

**Formatters (via conform.nvim):** black (Python), terraform_fmt, stylua (Lua)

**TreeSitter languages:** python, lua, c, cpp, bash, terraform, cmake, slang

**Session management:** resession.nvim - auto-saves by working directory on exit

## Adding New Components

- **New plugin:** Add to `lua/plugins/plugins.lua`
- **New keybinding:** Add to `lua/config/keymaps.lua`
- **New LSP server:** Add `vim.lsp.config()` and `vim.lsp.enable()` in `lua/config/lsp.lua`
- **New autocommand:** Add to `lua/config/autocmds.lua`

## Key Keybindings Reference

| Key | Action |
|-----|--------|
| `<leader>p` | Find files (Telescope) |
| `<leader>r` | Live grep (Telescope) |
| `<leader>x` | Toggle Neotree sidebar |
| `<leader>g` | LazyGit |
| `<leader>ff` | Format buffer (conform) |
| `gd` | Go to definition |
| `gn` | Rename symbol |
| `gh` | Open diagnostic float |
| `<leader>dd` | Toggle diagnostics (Trouble) |
| `<leader>w/b/j/k` | Hop motions (word/line) |

## Commands

- `:Lazy` - Plugin manager UI
- `:LazyGit` - Git UI
- `:Trouble` - Diagnostics panel
- `:TSUpdate` - Update TreeSitter parsers
