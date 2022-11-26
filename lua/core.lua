require "core.keymaps"
require "core.options"

local function packer_ensure()
  local fn = vim.fn
  local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system { "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path }
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

-- If packer.nvim is not installed, install it.
packer_ensure()

-- Now we install plugins

require("packer").init { display = {
  open_fn = require("packer.util").float,
} }

_G.plugin = require("packer").use

local M = {}

local home = vim.env.HOME

local function get_config_path()
  local config = os.getenv "XDG_CONFIG_DIR"
  if not config then
    return home .. "/.config/nvim"
  end
  return config
end

function M.plugins()
  local plugins_dir = get_config_path() .. "/lua/plugins"
  local langs_dir = get_config_path() .. "lua/langs"

  local get_lua_files = function(dir)
    local list = {}
    local tmp = vim.split(vim.fn.globpath(dir, "*.lua"), "\n")
    for _, f in ipairs(tmp) do
      list[#list + 1] = string.match(f, "lua/(.+).lua$")
    end
    return list
  end

  for _, m in ipairs(get_lua_files(plugins_dir)) do
    require(m)
  end

  for _, m in ipairs(get_lua_files(langs_dir)) do
    require(m)
  end
end

return M
