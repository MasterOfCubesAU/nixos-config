-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Indenting
vim.opt.tabstop = 4
vim.opt.softtabstop = -1
vim.opt.shiftwidth = 0
vim.opt.expandtab = true
vim.opt.autoindent = true

-- Window splitting
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Wrapping
vim.opt.wrap = false

-- Sync clipboard between OS and vim
vim.opt.clipboard = "unnamedplus"

-- Keep cursor centered on screen
vim.opt.scrolloff = 999

-- Show which line your cursor is on
vim.o.cursorline = true

-- Preview on replace
vim.opt.inccommand = "split"

-- Ignore casing
vim.opt.ignorecase = true

-- Allow full range of colours in terminal
vim.opt.termguicolors = true

-- Remove default status line
vim.opt.showmode = false

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})



