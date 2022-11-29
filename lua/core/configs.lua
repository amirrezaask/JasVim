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

function config(store, ...)
  local names = { ... }
  local values = {}
  for _, name in ipairs(names) do
    table.insert(values, get(store, name))
  end
  return values[#values]
end
