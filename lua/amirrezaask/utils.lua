local M = {}

local function get(store, key)
  local names = vim.split(key, "%.")
  for _, name in ipairs(names) do
    local tmp = store[name]
    store = tmp
    if store == nil then
      break
    end
  end
  return store
end

_G.plugins = {}
_G.langs = {}

function cfg(store, ...)
  local names = { ... }
  local values = {}
  for _, name in ipairs(names) do
    table.insert(values, get(store, name))
  end
  return values[#values]
end

function M.get_command(name)
  local all = vim.api.nvim_get_commands {}
  for _, cmd in pairs(all) do
    if cmd.name == name then
      return cmd
    end
  end
end

return M
