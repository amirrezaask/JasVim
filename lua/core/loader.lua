local home = vim.env.HOME

local function get_config_path()
  local config = os.getenv "XDG_CONFIG_DIR"
  if not config then
    return home .. "/.config/nvim"
  end
  return config
end

-- Plugins register their config callback in here
_G.conf = {}

local load = function()
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
  local ok, _ = pcall(require, "which-key")
  if ok then
    require("which-key").setup {}
  end

  require("core.packer").reload()
end

vim.api.nvim_create_user_command("Reload", "<cmd>so ~/.config/nvim/init.lua<cr>", {})
nnoremap("<leader>cr", "<cmd>so ~/.config/nvim/init.lua<CR>", {})

load()
