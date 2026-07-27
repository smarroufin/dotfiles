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
vim.opt.tabstop = 2 -- The width of a TAB is set to 2. Still it is a \t. It is just that Vim will interpret it to be having a width of 2.
vim.opt.shiftwidth = 2 -- Indents will have a width of 2
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
