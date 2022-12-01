local home = vim.env.HOME

local function get_config_path()
  local config = os.getenv "XDG_CONFIG_DIR"
  if not config then
    return home .. "/.config/nvim"
  end
  return config
end

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

  vim.cmd.PackerInstall()

  for _, cfg in pairs(configs) do
    pcall(cfg)
  end
end

vim.api.nvim_create_user_command("Reload", "so ~/.config/nvim/init.lua", {})
nnoremap("<leader>cr", "<cmd>so ~/.config/nvim/init.lua<CR>", {})

load()
