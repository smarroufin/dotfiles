return {
  {
    'Mofiqul/dracula.nvim',
    lazy = false,
    priority = 1000,
    init = function()
      vim.cmd.colorscheme('dracula')
    end,
    opts = {
      transparent_bg = true,
    },
  },
}
