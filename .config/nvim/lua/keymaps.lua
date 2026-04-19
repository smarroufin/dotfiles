local util = require('util')
util.keymap('<Space>', '<Nop>', { desc = 'Unmap space' })
util.keymap('<Esc>', '<Esc>:noh<cr>', { desc = 'Clear highlights' })
-- Diagnostic
util.keymap('<leader>dd', vim.diagnostic.open_float, { desc = 'Diagnostic details' })
util.keymap('<leader>dk', function() vim.diagnostic.jump({ count = -1 }) end, { desc = 'Previous diagnostic' })
util.keymap('<leader>dj', function() vim.diagnostic.jump({ count = 1 }) end, { desc = 'Next diagnostic' })
-- Buffers
util.keymap('<leader>jd', ':bdelete<cr>', { desc = 'Delete current buffer' })
util.keymap("<leader>jj", ":bnext<cr>", { desc = "Next buffer" })
util.keymap("<leader>jk", ":bprevious<cr>", { desc = "Previous buffer" })
-- Window
util.keymap('<leader>w', '<C-w>')
-- Indent
util.keymap('<', '<gv', { desc = 'Keep visual selection after indent', modes = 'v' })
util.keymap('>', '>gv', { desc = 'Keep visual selection after indent', modes = 'v' })
-- Registers
util.keymap('x', '"_x', { desc = 'Delete without affecting register', modes = { 'n', 'v' } })
