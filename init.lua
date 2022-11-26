-- Jasvim
-- Core libraries and helpers are in $HOME/.config/nvim/lua/core/*.lua
-- Configurations for all plugins reside in $HOME/.config/nvim/lua/plugins/<plugin name>.lua
-- Language configurations are in $HOME/.config/nvim/lua/langs/<language name>.lua
-- All configurations will load automatically and there is no need to source your stuff in your init.lua
-- Also some plugins are grouped under one group name forexample all git related plugins are in git.lua

require "core"

local home = vim.env.HOME

local function get_config_path()
  local config = os.getenv "XDG_CONFIG_DIR"
  if not config then
    return home .. "/.config/nvim"
  end
  return config
end

local plugins_dir = get_config_path() .. "/lua/plugins"

local langs_dir = get_config_path() .. "/lua/langs"

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

vim.cmd [[ PackerInstall ]]
