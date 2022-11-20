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

jasvim.plugin = jasvim.L("packer").use

jasvim.L("packer").init {
  display = {
    open_fn = jasvim.L("packer.util").float,
  },
}

jasvim.plugin "wbthomason/packer.nvim"
