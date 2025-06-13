return {
  {
    'EdenEast/nightfox.nvim',
    enabled = not vim.g.vscode,
    lazy = false,
    priority = 1000,
    init = function()
      vim.cmd.colorscheme('carbonfox')
    end,
  },
}
