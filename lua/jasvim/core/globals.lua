_G.jasvim = {}

jasvim.version = "0.1.0"

jasvim.R = function(name)
  package.loaded[name] = nil
  return require(name)
end

jasvim.P = function(obj)
  print(vim.inspect(obj))
end

function jasvim.onsave(opts)
  local pattern = opts.pattern
  local callback = opts.callback
  local group = opts.group
  if group == nil then
    local augroup_name = ""
    if type(pattern) == "table" then
      augroup_name = table.concat(pattern, ",") .. "-onsave"
    end
    if type(pattern) == "string" then
      augroup_name = pattern .. "-onsave"
    end
    group = vim.api.nvim_create_augroup(augroup_name, {})
  end
  vim.api.nvim_create_autocmd("BufWritePost", {
    group = group,
    pattern = pattern,
    callback = callback,
  })
end

local function make_mapper(mode, default_opts)
  return function(lhs, rhs, opts)
    opts = opts or {}
    opts = vim.tbl_extend("force", opts, default_opts)
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

jasvim.nnoremap = make_mapper("n", { noremap = true })
jasvim.inoremap = make_mapper("i", { noremap = true })
jasvim.vnoremap = make_mapper("v", { noremap = true })

function jasvim.buf_vnoremap(buf, lhs, rhs, opts)
  jasvim.vnoremap(lhs, rhs, vim.tbl_extend("force", { buffer = buf }, opts))
end

function jasvim.buf_inoremap(buf, lhs, rhs, opts)
  jasvim.inoremap(lhs, rhs, vim.tbl_extend("force", { buffer = buf }, opts))
end

function jasvim.buf_nnoremap(buf, lhs, rhs, opts)
  jasvim.nnoremap(lhs, rhs, vim.tbl_extend("force", { buffer = buf }, opts))
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
  require "jasvim.core.keymaps"
  require "jasvim.core.options"
  require "jasvim.core.plugins"
  local has_impatient, _ = pcall(require, "impatient")
  if has_impatient then
    require("impatient").enable_profile()
  end
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
      else
        if type(mod.keymaps) == "function" then
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
