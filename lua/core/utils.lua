local M = {}

function M.get_command(name)
  local all = vim.api.nvim_get_commands {}
  for _, cmd in pairs(all) do
    if cmd.name == name then
      return cmd
    end
  end
end

return M
