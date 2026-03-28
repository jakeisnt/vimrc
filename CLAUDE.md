# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Development Environment

This config uses a Nix flake for the development environment. Activate it with direnv (auto-applied via `.envrc`) or manually:

```bash
nix develop     # enter dev shell with stylua, luajit, lua-language-server
```

Format Lua files with:
```bash
stylua lua/     # respects stylua.toml (2-space indent, 120 col width)
```

## Architecture

The entry point is `init.lua`, which loads config modules in this order:
1. `lua/jakeisnt/autoupdate.lua` — async git pull check on startup
2. `lua/jakeisnt/lazy_init.lua` — bootstraps lazy.nvim plugin manager
3. `lua/jakeisnt/aucmds.lua` — autocommands (filetype indent, yank highlight, shell history)
4. `lua/jakeisnt/options.lua` — vim options
5. `lua/jakeisnt/keymap.lua` — global keybindings (leader = space)

## Plugin System

All plugins live in `lua/jakeisnt/lazy/` — one file per plugin or related group. Lazy.nvim auto-discovers everything in that directory. Each file returns a lazy.nvim spec table.

Key plugin files:
- `lsp.lua` — LSP setup (9 servers), nvim-cmp completion, LuaSnip snippets
- `treesitter.lua` — syntax, indentation, autopairs, rainbow brackets
- `conform.lua` — formatters (stylua, black, rustfmt, prettier)
- `telescope.lua` — fuzzy finder; `<leader>ff` files, `<leader>fg` grep
- `trouble.lua` — diagnostic UI; `<leader>xx` toggles
- `neogit.lua` — git UI; `<leader>gg` opens
- `avante.lua` — AI assistant (Copilot backend)
- `llm.lua` — custom streaming LLM integration (OpenRouter + Groq)

## Adding a Plugin

Create a new file in `lua/jakeisnt/lazy/` returning a valid lazy.nvim spec. Use `event`, `cmd`, or `ft` for lazy loading. No registration step needed — lazy.nvim scans the directory.

## Formatting Convention

- Lua: 2-space indentation (per `aucmds.lua` filetype override and `stylua.toml`)
- All other files: follow existing style in the file
