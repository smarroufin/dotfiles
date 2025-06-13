return {
  {
    'mbbill/undotree',
    enabled = not vim.g.vscode,
    keys = {
      { '<leader>u', vim.cmd.UndotreeToggle, desc = 'Open [U]ndoTree' },
    },
  },
}
