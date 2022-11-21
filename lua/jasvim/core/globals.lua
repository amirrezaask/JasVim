_G.jasvim = {}

jasvim.version = "0.1.0"

function jasvim.onsave(pattern, callback)
  local augroup_name = ""
  if type(pattern) == "table" then
    augroup_name = table.concat(pattern, ",") .. "-onsave"
  end
  if type(pattern) == "string" then
    augroup_name = pattern .. "-onsave"
  end
  vim.api.nvim_create_autocmd("BufWritePost", {
    group = vim.api.nvim_create_augroup(augroup_name, {}),
    pattern = pattern,
    callback = callback,
  })
end
jasvim.window_height = function()
  return vim.api.nvim_win_get_height(0)
end

jasvim.window_width = function()
  return vim.api.nvim_win_get_width(0)
end

function jasvim.L(name)
  local exists, _ = pcall(require, name)
  if exists then
    return require(name)
  end
  vim.api.nvim_err_writeln(string.format("module %s does not exists", name))
end

-- Enable modules
-- @param names: table
function jasvim.modules(names)
  for _, name in ipairs(names) do
    local mod = require(name)
    if type(mod) == "table" and mod.plugins then
      local plugins = nil
      if type(mod.plugins) == "function" then
        plugins = mod.plugins()
      else
        if type(mod.plugins) == "table" then
          plugins = mod.plugins
        end
      end
      for _, spec in ipairs(plugins) do
        jasvim.plugin(spec)
      end
    end
  end
  for _, name in ipairs(names) do
    local mod = require(name)
    if type(mod) == "table" and mod.configs then
      mod.configs()
    end
  end
  for _, name in ipairs(names) do
    local mod = require(name)
    if type(mod) == "table" and mod.keymaps then
      if type(mod.keymaps) == "table" then
        jasvim.bind(mod.keymaps)
      else if type(mod.keymaps) == 'function' then
        mod.keymaps()
      end
      end
    end
  end
end

function jasvim.append(...)
  local out = {}
  for _, t in ipairs { ... } do
    if type(t) == "table" then
      for _, elem in ipairs(t) do
        table.insert(out, elem)
      end
    end
  end
  return out
end
