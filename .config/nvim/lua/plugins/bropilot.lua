vim.pack.add({
  'https://github.com/meeehdi-dev/bropilot.nvim',
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/j-hui/fidget.nvim',
  'https://github.com/Leonardo-Luz/dotenv.nvim',
})

local opts = {
  -- model = 'qwen2.5-coder:7b-base',
  -- model = 'starcoder2:7b',
  auto_suggest = false,
  keymap = {
    accept_word = '<C-l>',
    accept_line = '<S-Tab>',
    accept_block = '<Tab>',
    suggest = '<C-j>',
  },
}
require('dotenv').load()
local providers = {
  mistralEnterprise = {
    provider = 'mistral',
    api_key = vim.env.MISTRAL_ENTERPRISE_API_KEY,
  },
  mistralOpensource = {
    provider = 'mistral',
    api_key = vim.env.MISTRAL_OPENSOURCE_API_KEY,
  },
  codestral = {
    provider = 'codestral',
    api_key = vim.env.MISTRAL_CODESTRAL_API_KEY,
  },
}
local privateFolders = vim.split(vim.env.PRIVATE_FOLDERS or '', ',')
local isPrivateFolder = false
local cwd = vim.fn.getcwd()
for _, folder in ipairs(privateFolders) do
  local start = string.find(cwd, folder, 1, true)
  if start ~= nil then
    isPrivateFolder = true
    break
  end
end
if isPrivateFolder then
  vim.tbl_extend('force', opts, providers.mistralEnterprise)
else
  vim.tbl_extend('force', opts, providers.mistralOpensource)
end
require('bropilot').setup(opts)
