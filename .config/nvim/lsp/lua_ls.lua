---@type vim.lsp.Config
return {
  settings = {
    -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#lua_ls
    Lua = {
      runtime = {
        version = "LuaJIT",
        path = {
          "lua/?.lua",
          "lua/?/init.lua",
        },
      },
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME,
          "${3rd}/luv/library",
        },
      },
    },
  },
}
