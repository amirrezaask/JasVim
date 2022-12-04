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

local packer_bootstrap = ensure_packer()

require("packer").startup {
  function(use)
    use "wbthomason/packer.nvim"
    use "lewis6991/impatient.nvim"
    use "numToStr/Comment.nvim"

    use "sainnhe/sonokai"
    use "folke/tokyonight.nvim"
    use "Mofiqul/dracula.nvim"
    use "ellisonleao/gruvbox.nvim"
    use "tanvirtin/monokai.nvim"
    use "bluz71/vim-nightfly-colors"
    use "navarasu/onedark.nvim"
    use "Shatur/neovim-ayu"
    use "rose-pine/neovim"
    use "EdenEast/nightfox.nvim"
    use "bluz71/vim-moonfly-colors"
    use { "catppuccin/nvim", as = "catppuccin" }
    use "tiagovla/tokyodark.nvim"
    use {
      "glepnir/zephyr-nvim",
      requires = { "nvim-treesitter/nvim-treesitter", opt = true },
    }

    use {
      "nvim-treesitter/nvim-treesitter",
    }

    use {
      "nvim-treesitter/nvim-treesitter-textobjects",
      after = "nvim-treesitter",
    }

    use {
      "p00f/nvim-ts-rainbow",
      after = "nvim-treesitter",
    }

    use {
      "nvim-treesitter/nvim-treesitter-context",
      after = "nvim-treesitter",
    }
    use {
      "goolord/alpha-nvim",
      requires = { "kyazdani42/nvim-web-devicons" },
    }
    use {
      "neovim/nvim-lspconfig",
    }

    use {
      "hrsh7th/nvim-cmp",
      requires = {
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-path",
      },
    }

    use "pbrisbin/vim-mkdir"

    use "sheerun/vim-polyglot"

    use "szw/vim-maximizer"

    use "fladson/vim-kitty"

    use "towolf/vim-helm"

    use "tpope/vim-surround"

    use "junegunn/vim-easy-align"

    use "kevinhwang91/nvim-bqf"

    use "tpope/vim-eunuch"

    use "tpope/vim-sleuth"

    use {
      "windwp/nvim-autopairs",
    }

    use {
      "stevearc/dressing.nvim",
    }
    use {
      "j-hui/fidget.nvim",
    }

    use {
      "lewis6991/gitsigns.nvim",
    }

    use {
      "junegunn/gv.vim",
    }

    use {
      "cohama/agit.vim",
    }

    use {
      "TimUntersberger/neogit",
      requires = "nvim-lua/plenary.nvim",
    }

    use {
      "tpope/vim-fugitive",
    }

    use {
      "ray-x/go.nvim",
    }

    use {
      "ThePrimeagen/harpoon",
      requires = {
        "nvim-lua/plenary.nvim",
      },
    }
    use {
      "b0o/schemastore.nvim",
    }

    use {
      "ray-x/lsp_signature.nvim",
    }

    use "onsails/lspkind.nvim"
    use {
      "glepnir/lspsaga.nvim",
      branch = "main",
    }
    use {
      "folke/neodev.nvim",
      requires = { "nvim-lua/plenary.nvim" },
    }
    use "milisims/nvim-luaref"
    use "nanotee/luv-vimdocs"

    use {
      "L3MON4D3/LuaSnip",
      requires = "rafamadriz/friendly-snippets",
    }
    use {
      "williamboman/mason.nvim",
      requires = {
        "jayp0521/mason-nvim-dap.nvim",
        "williamboman/mason-lspconfig.nvim",
      },
    }
    use {
      "jose-elias-alvarez/null-ls.nvim",
    }

    use {
      "nvim-tree/nvim-tree.lua",
      requires = {
        "nvim-tree/nvim-web-devicons", -- optional, for file icons
      },
      tag = "nightly", -- optional, updated every week. (see issue #1193)
    }

    use {
      "purescript-contrib/purescript-vim",
    }

    use "Glench/Vim-Jinja2-Syntax"
    use {
      "rust-lang/rust.vim",
    }

    use {
      "simrat39/rust-tools.nvim",
    }
    use {
      "mrjones2014/smart-splits.nvim",
    }
    use {
      "akinsho/toggleterm.nvim",
    }
    use { "christoomey/vim-tmux-navigator" }
    use {
      "ziglang/zig.vim",
    }
  end,
  config = {
    compile_path = require("packer.util").join_paths(vim.fn.stdpath "data", "packer_compiled.lua"),
    display = {
      open_fn = require("packer.util").float,
    },
  },
}

if packer_bootstrap then
  require("packer").sync()
end

local ok, impatient = pcall(require, "impatient")
