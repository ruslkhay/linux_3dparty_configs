# Neovim Config

Minimal setup for Python / C++ / Lua development.

## Requirements

- **Neovim >= 0.11** (pinned plugins are not compatible with 0.12+ yet)
- **git** — for lazy.nvim bootstrap and plugin installs
- **gcc / cc** — to compile treesitter parsers on first launch
- A **Nerd Font** or **NerdFontsSymbolsOnly** set as terminal fallback font — for icons

## First Launch

On the very first `nvim` startup, lazy.nvim bootstraps itself, then installs
all plugins. Treesitter parsers (Python, C++, Lua) compile automatically.
This takes ~1 minute; subsequent launches are instant.

## Plugins

| Plugin | Purpose |
|--------|---------|
| [lazy.nvim](https://github.com/folke/lazy.nvim) | Plugin manager |
| [nvim-treesitter v0.9.2](https://github.com/nvim-treesitter/nvim-treesitter) | Syntax highlighting for Python, C++, Lua |
| [catppuccin](https://github.com/catppuccin/nvim) | Colorscheme |

## Keybindings

| Key | Action |
|-----|--------|
| `Space + w` | Save file |
| `Space + h` | Clear search highlight |
| `Ctrl + h/j/k/l` | Navigate between splits |

## Customization

**Colorscheme flavour** — edit `init.lua`, change `flavour`:
```
latte  (light)  frappe  macchiato  mocha  (dark, default)
```

**Font** (GUI clients only — Neovide, nvim-qt) — uncomment and edit:
```lua
vim.o.guifont = 'JetBrainsMono Nerd Font:h14'
```

**Add a language** — extend `ensure_installed` in `init.lua`:
```lua
ensure_installed = { 'python', 'cpp', 'lua', 'rust' },
```
Then run `:TSUpdate` inside nvim.

## Notes

- nvim-treesitter is pinned to `v0.9.2` — the last release supporting Neovim 0.11.
  When you upgrade to Neovim 0.12+, remove the `tag` line to track latest.
- Plugins are installed to `~/.local/share/nvim/lazy/` (not tracked by git).
  `lazy-lock.json` pins exact versions for reproducible installs.
