---Create a keymap
---@param lhs string The key sequence to map
---@param rhs string|function The command or function to execute
---@param opts? table Optional table with 'modes' or `vim.keymap.set.Opts` fields
local function keymap(lhs, rhs, opts)
  opts = opts or {}
  local modes = opts.modes or 'n'
  local final_opts = vim.tbl_extend('force', {}, opts)
  final_opts.modes = nil
  vim.keymap.set(modes, lhs, rhs, final_opts)
end

return { keymap = keymap }
