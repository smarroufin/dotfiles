-- https://neovim.io/doc/user/options.html
-- [[ Global ]]
vim.g.mapleader = ' '

-- [[ Options ]]
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.scrolloff = 5
vim.opt.signcolumn = 'yes'
vim.opt.mouse = 'a'
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.tabstop = 2 -- The width of a TAB is set to 4. Still it is a \t. It is just that Vim will interpret it to be having a width of 4.
vim.opt.shiftwidth = 2 -- Indents will have a width of 4
vim.opt.softtabstop = 2 -- Sets the number of columns for a TAB
vim.opt.expandtab = true -- Expand TABs to spaces
vim.opt.breakindent = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.timeoutlen = 500
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.inccommand = 'split'
vim.opt.undofile = true -- Save file history for undotree
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

-- [[ Keymaps ]]
local util = require('util')
util.keymap('<Space>', '<Nop>', { desc = 'Unmap space' })
util.keymap('<Esc>', '<Esc>:noh<CR>', { desc = 'Clear highlights' })
-- Diagnostic
vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '󰅙',
      [vim.diagnostic.severity.WARN] = '',
      [vim.diagnostic.severity.INFO] = '󰋼',
      [vim.diagnostic.severity.HINT] = '󰌵',
    },
  },
  virtual_text = { current_line = true },
})
util.keymap('<leader>dd', vim.diagnostic.open_float, { desc = 'Diagnostic details' })
util.keymap('<leader>dk', function() vim.diagnostic.jump({ count = -1 }) end, { desc = 'Previous diagnostic' })
util.keymap('<leader>dj', function() vim.diagnostic.jump({ count = 1 }) end, { desc = 'Next diagnostic' })
-- Buffers
util.keymap('<leader>ad', ':bd<CR>', { desc = 'Delete current buffer' })
-- Window
util.keymap('<leader>w', '<C-w>')
-- Indent
util.keymap('<', '<gv', { desc = 'Keep visual selection after indent', modes = 'v' })
util.keymap('>', '>gv', { desc = 'Keep visual selection after indent', modes = 'v' })
-- Registers
util.keymap('x', '"_x', { desc = 'Delete without affecting register', modes = { 'n', 'v' } })
util.keymap('<leader>p', '"_dP', { desc = 'Paste without affecting register', modes = 'v' })

-- [[ Autocommands ]]
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
