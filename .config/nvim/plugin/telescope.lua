vim.pack.add({
  {
    src = 'https://github.com/nvim-telescope/telescope.nvim',
    version = vim.version.range('^0.1'),
  },
  'https://github.com/nvim-lua/plenary.nvim',
  {
    src = 'https://github.com/nvim-telescope/telescope-fzf-native.nvim', -- requires gcc & make
    post_install = function()
      vim.cmd('make')
    end,
    post_update = function()
      vim.cmd('make')
    end,
  },
  'https://github.com/nvim-telescope/telescope-ui-select.nvim',
  'https://github.com/nvim-treesitter/nvim-treesitter',
  'https://github.com/nvim-tree/nvim-web-devicons',
})

local telescopeConfig = require('telescope.config')
local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }
table.insert(vimgrep_arguments, '--hidden')
table.insert(vimgrep_arguments, '--glob=!**/.git/*')

local telescope = require('telescope')
telescope.setup({
  defaults = {
    -- Ignore `.git/` folder in text grep commands
    vimgrep_arguments = vimgrep_arguments,
    layout_config = {
      horizontal = {
        width = 0.9,
        preview_cutoff = 100,
      },
    },
  },
  pickers = {
    find_files = {
      -- Ignore `.git/` folder
      find_command = { 'rg', '--files', '--hidden', '--glob=!**/.git/*' },
    },
  },
  extensions = {
    fzf = {},
    ['ui-select'] = {
      require('telescope.themes').get_dropdown(),
    },
  },
})
-- telescope.load_extension('fzf')
telescope.load_extension('ui-select')
-- configure file preview
vim.api.nvim_create_autocmd('User', {
  pattern = 'TelescopePreviewerLoaded',
  callback = function()
    vim.wo.wrap = true
  end,
})

-- search
vim.keymap.set('n', '<leader>f', require('telescope.builtin').find_files, { desc = 'Search [F]iles' })
vim.keymap.set('n', '<leader>F', function()
  require('telescope.builtin').find_files({ no_ignore = true, no_ignore_parent = true })
end, { desc = 'Search All [F]iles' })
vim.keymap.set('n', '<leader>so', require('telescope.builtin').oldfiles, { desc = 'Search [O]ld files' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = 'Search text [G]rep' }) -- requires ripgrep
vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = 'Search [R]esume' })
vim.keymap.set('n', '<leader>sk', require('telescope.builtin').keymaps, { desc = 'Search [K]eymaps' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = 'Search [H]elp' })
vim.keymap.set('n', '<leader>sn', function()
  require('telescope.builtin').find_files({ cwd = vim.fn.stdpath('config') })
end, { desc = 'Search [N]eovim files' })
-- todo-comments
vim.keymap.set('n', '<leader>st', '<CMD>TodoTelescope<CR>', { desc = 'Search [T]oDo' })
-- buffers
vim.keymap.set('n', '<leader>as', require('telescope.builtin').buffers, { desc = 'Search Buffers' })
-- lsp
vim.keymap.set('n', 'grd', require('telescope.builtin').lsp_definitions, { desc = 'Goto [D]efinition' })
vim.keymap.set('n', 'grr', require('telescope.builtin').lsp_references, { desc = 'Goto [R]eferences' })
vim.keymap.set('n', 'gri', require('telescope.builtin').lsp_implementations, { desc = 'Goto [I]mplementation' })
vim.keymap.set('n', 'gO', require('telescope.builtin').lsp_document_symbols, { desc = 'Document Symbols' })
-- git
vim.keymap.set('n', '<leader>gg', require('telescope.builtin').git_status, { desc = 'Git status' })
vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_bcommits, { desc = 'Git file commits' })
-- telescope
vim.keymap.set('n', '<leader><leader>b', require('telescope.builtin').builtin, { desc = 'Builtin' })
