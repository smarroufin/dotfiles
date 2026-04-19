vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == 'telescope-fzf-native.nvim' and (kind == 'install' or kind == 'update') then
      vim.system({ 'make' }, { cwd = ev.data.path })
    end
  end,
})

vim.pack.add({
  'https://github.com/nvim-telescope/telescope.nvim',
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/nvim-telescope/telescope-fzf-native.nvim', -- requires gcc & make
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
        width = 0.999,
        height = 0.999,
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
telescope.load_extension('fzf')
telescope.load_extension('ui-select')
-- configure file preview
vim.api.nvim_create_autocmd('User', {
  pattern = 'TelescopePreviewerLoaded',
  callback = function()
    vim.wo.wrap = true
  end,
})

local util = require('util')
-- search
util.keymap('<leader>f', require('telescope.builtin').find_files, { desc = 'Search [F]iles' })
util.keymap('<leader>F', function() require('telescope.builtin').find_files({ no_ignore = true, no_ignore_parent = true }) end, { desc = 'Search All [F]iles' })
util.keymap('<leader>so', require('telescope.builtin').oldfiles, { desc = 'Search [O]ld files' })
util.keymap('<leader>sg', require('telescope.builtin').live_grep, { desc = 'Search text [G]rep' }) -- requires ripgrep
util.keymap('<leader>sg', require('telescope.builtin').grep_string, { desc = 'Search text [G]rep', modes = 'v' }) -- requires ripgrep
util.keymap('<leader>sr', require('telescope.builtin').resume, { desc = 'Search [R]esume' })
util.keymap('<leader>sk', require('telescope.builtin').keymaps, { desc = 'Search [K]eymaps' })
util.keymap('<leader>sh', require('telescope.builtin').help_tags, { desc = 'Search [H]elp' })
util.keymap('<leader>sn', function() require('telescope.builtin').find_files({ cwd = vim.fn.stdpath('config') }) end, { desc = 'Search [N]eovim files' })
-- todo-comments
util.keymap('<leader>st', ':TodoTelescope<cr>', { desc = 'Search [T]oDo' })
-- buffers
util.keymap('<leader>js', require('telescope.builtin').buffers, { desc = 'Search Buffers' })
-- diagnostic
util.keymap('<leader>ds', require('telescope.builtin').diagnostics, { desc = 'Search Diagnostic' })
-- lsp
util.keymap('grd', require('telescope.builtin').lsp_definitions, { desc = 'Goto [D]efinition' })
util.keymap('grr', require('telescope.builtin').lsp_references, { desc = 'Goto [R]eferences' })
util.keymap('gri', require('telescope.builtin').lsp_implementations, { desc = 'Goto [I]mplementation' })
util.keymap('gO', require('telescope.builtin').lsp_document_symbols, { desc = 'Document Symbols' })
-- git
util.keymap('<leader>gg', require('telescope.builtin').git_status, { desc = 'Git status' })
util.keymap('<leader>gf', require('telescope.builtin').git_bcommits, { desc = 'Git file commits' })
-- telescope
util.keymap('<leader><leader>b', require('telescope.builtin').builtin, { desc = 'Builtin' })
