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

require("packer").init {
  compile_path = require("packer.util").join_paths(vim.fn.stdpath "data", "packer_compiled.lua"),
  display = {
    open_fn = require("packer.util").float,
  },
}
local configs = {}

local function plugin(spec)
  if type(spec) == "table" then
    if spec.config then
      table.insert(configs, spec.config)
      spec.config = nil
    end
  end
  require("packer").use(spec)
end

_G.plugin = plugin

plugin "wbthomason/packer.nvim"
plugin "lewis6991/impatient.nvim"

local _, _ = pcall(require, "impatient")

local function reload()
  vim.cmd [[PackerInstall]]
  for _, cfg in ipairs(configs) do
    pcall(cfg)
  end
end

return {
  reload = reload,
}
