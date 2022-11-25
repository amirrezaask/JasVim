local M = {}

local default_colorscheme = "tokyonight-night"

function M.plugins()
  return {
    "sainnhe/sonokai",
    "folke/tokyonight.nvim",
    "Mofiqul/dracula.nvim",
    "ellisonleao/gruvbox.nvim",
    "tanvirtin/monokai.nvim",
    "bluz71/vim-nightfly-colors",
    "navarasu/onedark.nvim",
    "aktersnurra/no-clown-fiesta.nvim",
    "Shatur/neovim-ayu",
    "rose-pine/neovim",
    "projekt0n/github-nvim-theme",
    "Mofiqul/vscode.nvim",
    "EdenEast/nightfox.nvim",
    { "catppuccin/nvim", as = "catppuccin" },
    "eemed/sitruuna.vim",
  }
end

function M.configs()
  local set_colorscheme = [[ colorscheme  ]] .. (jvim.colorscheme or default_colorscheme)
  local ok, _ = pcall(vim.cmd, set_colorscheme)
end

return M
