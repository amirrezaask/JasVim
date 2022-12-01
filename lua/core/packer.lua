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

-- Where plugins store their configurations
configs = {}

use = require("packer").use

use "wbthomason/packer.nvim"
use "lewis6991/impatient.nvim"

local _, _ = pcall(require, "impatient")

local function reload() end

return {
  reload = reload,
}
