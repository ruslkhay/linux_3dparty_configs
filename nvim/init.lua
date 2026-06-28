vim.g.mapleader = ' '

-- Disable unused providers to suppress health warnings
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    'git', 'clone', '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({

  -- Treesitter: syntax highlighting for Python, C++, Lua
  -- Pinned to v0.9.2 — the last release compatible with Neovim 0.11
  {
    'nvim-treesitter/nvim-treesitter',
    tag = 'v0.9.2',
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = { 'python', 'cpp', 'lua' },
        highlight = { enable = true },
        indent   = { enable = true },
      })
    end,
  },

  -- Colorscheme — change flavour to: latte, frappe, macchiato, mocha
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    config = function()
      require('catppuccin').setup({
        flavour = 'mocha',
      })
      vim.cmd.colorscheme('catppuccin')
    end,
  },

}, {
  rocks = { enabled = false }, -- disable luarocks (not needed)
})

-- ── Options ───────────────────────────────────────────────────────────────────

vim.opt.number         = true
vim.opt.relativenumber = true
vim.opt.mouse          = 'a'
vim.opt.clipboard      = 'unnamedplus'
vim.opt.scrolloff      = 8
vim.opt.completeopt    = { 'menu', 'menuone', 'noselect' }
vim.opt.termguicolors  = true
vim.opt.signcolumn     = 'yes'
vim.opt.splitright     = true
vim.opt.splitbelow     = true

-- Indentation
vim.opt.tabstop     = 4
vim.opt.shiftwidth  = 4
vim.opt.softtabstop = 4
vim.opt.expandtab   = true
vim.opt.smartindent = true

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase  = true

-- Font (only applies to GUI clients like Neovide or nvim-qt)
-- vim.o.guifont = 'JetBrainsMono Nerd Font:h14'

-- ── Keybindings ───────────────────────────────────────────────────────────────

local map = vim.keymap.set

map('n', '<leader>w', '<cmd>w<CR>')
map('n', '<leader>h', '<cmd>nohlsearch<CR>')
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')
