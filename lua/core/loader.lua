local home = vim.env.HOME

local function get_config_path()
  local config = os.getenv "XDG_CONFIG_DIR"
  if not config then
    return home .. "/.config/nvim"
  end
  return config
end

-- Plugins register their config callback in here
_G.conf = {};

(function()
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
end)()
