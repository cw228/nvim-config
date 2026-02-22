# GEMINI.md: Neovim Configuration

This file provides a comprehensive overview of this Neovim configuration, intended to be used as instructional context for future AI interactions.

## Project Overview

This is a personal Neovim configuration written in Lua. It uses `lazy.nvim` for plugin management, providing a modern and efficient setup. The configuration is modular, with different aspects like plugins, keymaps, and options separated into their own files under the `lua/` directory.

The main entry point is `init.lua`, which loads the rest of the configuration.

Key features of this configuration include:
*   **Plugin Management:** Handled by `lazy.nvim`.
*   **LSP:** Integrated via `nvim-lspconfig` for code intelligence.
*   **Code Completion:** Provided by `nvim-cmp`.
*   **Fuzzy Finding:** Uses `telescope.nvim` for files, buffers, and more.
*   **Syntax Highlighting:** Enhanced with `nvim-treesitter`.
*   **File Explorer:** `neo-tree.nvim` provides a file tree.
*   **Session Management:** `resession.nvim` saves and loads sessions automatically.
*   **Git Integration:** `lazygit.nvim` provides a powerful Git UI.
*   **Formatting:** `conform.nvim` handles code formatting.

The default colorscheme is `nord`.

## Building and Running

As this is a Neovim configuration, there is no "build" step. To use this configuration, simply run Neovim:

```bash
nvim
```

On the first launch, `lazy.nvim` will automatically bootstrap itself and install all the configured plugins.

## Development Conventions

### Plugin Management

Plugins are defined in `lua/plugins/plugins.lua`. To add, remove, or configure a plugin, you should edit this file. The structure follows the `lazy.nvim` specification.

You can open the `lazy.nvim` interface with the keymap `<leader>L`.

### Configuration Structure

The configuration is split into several files inside `lua/config/`:
*   `opts.lua`: General Neovim options (e.g., indentation, appearance).
*   `keymaps.lua`: All custom keybindings.
*   `lsp.lua`: Configuration for the Language Server Protocol clients.
*   `autocmds.lua`: Autocommands for various events.
*   `lazy.lua`: The bootstrap and setup for the `lazy.nvim` plugin manager.

### Keymaps

The leader key is set to the **Space** key (`" "`). Many custom keymaps are defined in `lua/config/keymaps.lua` and use the leader key. Here are some important ones:

*   `<leader>p`: Find files with Telescope.
*   `<leader>r`: Live grep with Telescope.
*   `<leader>x`: Toggle the Neotree file explorer.
*   `<leader>g`: Open LazyGit.
*   `<leader>ff`: Format the current buffer with `conform.nvim`.

### Formatting

Code formatting is handled by `conform.nvim`. It is configured to use:
*   `black` for Python.
*   `terraform_fmt` for Terraform.
*   `stylua` for Lua.

### LSP

LSP clients are configured in `lua/config/lsp.lua`. The following language servers are set up:
*   `lua_ls` for Lua.
*   `pyright` for Python.
*   `clangd` for C/C++.
*   `terraformls` for Terraform.
*   `slangd` for Slang.
