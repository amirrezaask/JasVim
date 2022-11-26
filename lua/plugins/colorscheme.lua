plugin "sainnhe/sonokai"
plugin "folke/tokyonight.nvim"
plugin "Mofiqul/dracula.nvim"
plugin "ellisonleao/gruvbox.nvim"
plugin "tanvirtin/monokai.nvim"
plugin "bluz71/vim-nightfly-colors"
plugin "navarasu/onedark.nvim"
plugin "aktersnurra/no-clown-fiesta.nvim"
plugin "Shatur/neovim-ayu"
plugin "rose-pine/neovim"
plugin "projekt0n/github-nvim-theme"
plugin "Mofiqul/vscode.nvim"
plugin "EdenEast/nightfox.nvim"
plugin { "catppuccin/nvim", as = "catppuccin" }
plugin "eemed/sitruuna.vim"
plugin {
  "glepnir/zephyr-nvim",
  requires = { "nvim-treesitter/nvim-treesitter", opt = true },
}

pcall(vim.cmd, 'colorscheme tokyonight-night') 
