vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == 'nvim-treesitter' and (kind == 'install' or kind == 'update') then
      vim.cmd('TSUpdate')
    end
  end,
})
-- https://github.com/nvim-treesitter/nvim-treesitter/blob/6878ae017d691a0df1c49d8a091c88a33e4c2d50/doc/nvim-treesitter.txt#L39-L52
vim.api.nvim_create_autocmd('FileType', {
  pattern = { '*' },
  callback = function(ev)
    local ft = vim.bo[ev.buf].filetype
    local lang = vim.treesitter.language.get_lang(ft)
    if not lang then
      return
    end
    if not vim.treesitter.language.add(lang) then
      return
    end
    -- syntax highlighting, provided by Neovim
    vim.treesitter.start(ev.buf, lang)
    -- indentation, provided by nvim-treesitter
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})

vim.pack.add({
  'https://github.com/nvim-treesitter/nvim-treesitter', -- requires tree-sitter-cli
  'https://github.com/nvim-treesitter/nvim-treesitter-textobjects',
  'https://github.com/nvim-treesitter/nvim-treesitter-context',
})

local ts_parsers = {
  'c',
  'css',
  'dockerfile',
  'html',
  'javascript',
  'json',
  'lua',
  'markdown',
  'markdown_inline',
  'prisma',
  'query',
  'scss',
  'toml',
  'typescript',
  'vim',
  'vimdoc',
  'vue',
  'yaml',
}

require('nvim-treesitter').install(ts_parsers)
require('treesitter-context').setup({
  max_lines = 3,
  multiline_threshold = 1,
})
