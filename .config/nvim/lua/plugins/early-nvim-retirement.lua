return {
  {
    'chrisgrieser/nvim-early-retirement',
    enabled = not vim.g.vscode,
    event = 'VeryLazy',
    opts = {
      retirementAgeMins = 1,
    },
  },
}
