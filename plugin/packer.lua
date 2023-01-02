local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system { "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path }
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

ensure_packer()

require("packer").startup {
  function(use)
    use "wbthomason/packer.nvim" -- plugin manager itself
    use "lewis6991/impatient.nvim" -- Faster lua require using caching

    use { "folke/tokyonight.nvim" }
    use { "rose-pine/neovim", as = "rose-pine" }
    use { "navarasu/onedark.nvim" }
    use { "catppuccin/nvim", as = "catppuccin" }

    use { "numToStr/Comment.nvim" } -- Comment code with ease
    use { "nvim-lualine/lualine.nvim" } -- Statusline
    use {
      "nvim-telescope/telescope.nvim",
      requires = {
        {
          "nvim-telescope/telescope-fzf-native.nvim",
          run = "make",
        },
        { "nvim-lua/plenary.nvim" },
      },
    }
    -- Treesitter
    use { "nvim-treesitter/nvim-treesitter" }
    use { "nvim-treesitter/nvim-treesitter-textobjects", after = "nvim-treesitter" }
    use "nvim-treesitter/nvim-treesitter-context"

    use {
      "VonHeikemen/lsp-zero.nvim",
      requires = {
        -- LSP Support
        { "neovim/nvim-lspconfig" },
        { "williamboman/mason.nvim" },
        { "williamboman/mason-lspconfig.nvim" },

        -- Autocompletion
        { "hrsh7th/nvim-cmp" },
        { "hrsh7th/cmp-buffer" },
        { "hrsh7th/cmp-path" },
        { "saadparwaiz1/cmp_luasnip" },
        { "hrsh7th/cmp-nvim-lsp" },
        { "hrsh7th/cmp-nvim-lua" },

        -- Snippets
        { "L3MON4D3/LuaSnip" },
        { "rafamadriz/friendly-snippets" },

        -- Null ls
        { "jose-elias-alvarez/null-ls.nvim" },

        -- Fidget , standalone UI for lsp progress
        { "j-hui/fidget.nvim" },
      },
    }
    use "stevearc/oil.nvim" -- File manager like a BOSS
    use "pbrisbin/vim-mkdir" -- Automatically create directory if not exists
    use "fladson/vim-kitty" -- Support Kitty terminal config syntax
    use "towolf/vim-helm" -- Support for helm template syntax
    use "tpope/vim-surround" -- surrounding text objects
    use "kevinhwang91/nvim-bqf" -- Preview quickfix list item.
    use "tpope/vim-eunuch" -- Helper commands like :Rename, :Move, :Delete, :Remove, ...
    use "tpope/vim-sleuth" -- Heuristically set buffer options
    use "windwp/nvim-autopairs"
    use "lewis6991/gitsigns.nvim" -- Signs next to line numbers to show git status of a line
    use "tpope/vim-fugitive" -- Best Git Client after magit :)
    use "fatih/vim-go" -- Golang tools and code actions
    use "akinsho/toggleterm.nvim" -- Toggleterm
    use "folke/zen-mode.nvim" -- Focus on coding
  end,
  config = {
    compile_path = vim.fn.stdpath "data" .. "/site/plugin/packer_compiled.lua",
    display = {
      open_fn = function()
        return require("packer.util").float { border = "rounded" }
      end,
    },
  },
}

require("packer").install()

pcall(require, "impatient")
