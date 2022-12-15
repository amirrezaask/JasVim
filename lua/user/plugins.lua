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

-- Initialize packer
require("packer").init {
  compile_path = vim.fn.stdpath "data" .. "/site/plugin/packer_compiled.lua",
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

local _configs = {}

local use = function(spec)
  if type(spec) == "table" then
    if spec.config then
      table.insert(_configs, spec.config)
      spec.config = nil
    end
  end
  require("packer").use(spec)
end

use "wbthomason/packer.nvim"
use "lewis6991/impatient.nvim"

use "folke/tokyonight.nvim"
use "ellisonleao/gruvbox.nvim"
use "bluz71/vim-nightfly-colors"
use "navarasu/onedark.nvim"
use "rose-pine/neovim"
use "EdenEast/nightfox.nvim"
use "bluz71/vim-moonfly-colors"
use {
  "catppuccin/nvim",
  as = "catppuccin",
}

require "user.plugins.colorscheme"

-- Comment
use {
  "numToStr/Comment.nvim",
  config = function()
    require("Comment").setup()
  end,
}

-- Statusline
use {
  "nvim-lualine/lualine.nvim",
  requires = { "kyazdani42/nvim-web-devicons", opt = true },
  config = function()
    require("lualine").setup {}
  end,
}

-- Indent blanklines
use {
  "lukas-reineke/indent-blankline.nvim",
}

-- Telescope
use {
  "nvim-telescope/telescope.nvim",
  requires = {
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      run = "make",
    },
    { "nvim-lua/plenary.nvim" },
  },

  config = function()
    require "user.plugins.telescope"
  end,
}

-- Treesitter
use {
  "nvim-treesitter/nvim-treesitter",
  requires = {
    "nvim-treesitter/nvim-treesitter-textobjects",
    "p00f/nvim-ts-rainbow",
    "nvim-treesitter/nvim-treesitter-context",
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
  config = function()
    require "user.plugins.treesitter"
  end,
}

-- Mason
use {
  "williamboman/mason.nvim",
  requires = {
    { "williamboman/mason-lspconfig.nvim" },
  },
  config = function()
    require "user.plugins.mason"
  end,
}

-- Lsp configurations
use {
  "neovim/nvim-lspconfig",
  config = function()
    require "user.plugins.lsp"
  end,
}

-- Icons
use "kyazdani42/nvim-web-devicons"

-- trouble all errors, warning in one place
use {
  "folke/trouble.nvim",
  config = function()
    require("trouble").setup {}
  end,
}

-- Autocompletion
use {
  "hrsh7th/nvim-cmp",
  requires = {
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
    { "saadparwaiz1/cmp_luasnip" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-nvim-lua" },
  },
  config = function()
    require "user.plugins.cmp"
  end,
}

-- Snippets
use { "L3MON4D3/LuaSnip", requires = {
  { "rafamadriz/friendly-snippets" },
} }

-- Json Schemas
use { "b0o/schemastore.nvim" }

-- Null ls
use { "jose-elias-alvarez/null-ls.nvim" }

-- Automatically create directory when you create a new file in a directory that
-- does not exists.
use "pbrisbin/vim-mkdir"

-- Support for many filetypes.
use "sheerun/vim-polyglot"

-- toggle a window to be maximized, like tmux zoom
use "szw/vim-maximizer"

-- Support Kitty terminal config syntax
use "fladson/vim-kitty"

-- Support for helm template syntax
use "towolf/vim-helm"

-- surrounding text objects
use "tpope/vim-surround"

-- Preview quickfix list item.
use "kevinhwang91/nvim-bqf"

-- Helper commands like :Rename, :Move, :Delete, :Remove, ...
use "tpope/vim-eunuch"

-- Heuristically set buffer options
use "tpope/vim-sleuth"

use {
  "windwp/nvim-autopairs",
  config = function()
    require("nvim-autopairs").setup()
  end,
}

-- Better UI for neovim default UI components like input box or selecting
use {
  "stevearc/dressing.nvim",
  config = function()
    require("dressing").setup {
      input = {
        enabled = true,
      },
      select = {
        enabled = true,
      },
    }
  end,
}

use {
  "lewis6991/gitsigns.nvim",
  config = function()
    require("gitsigns").setup {}
  end,
}

-- Git integration
use {
  "tpope/vim-fugitive",
  config = function()
    vim.keymap.set("n", "<leader>g", "<cmd>Git<cr>")
  end,
}

-- Golang tools and code actions
use {
  "fatih/vim-go",
  config = function()
    require "user.plugins.go"
  end,
}

-- Harpoon
use {
  "ThePrimeagen/harpoon",
  requires = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require "user.plugins.harpoon"
  end,
}

use "ThePrimeagen/vim-be-good"

use {
  "rust-lang/rust.vim",
}

use {
  "simrat39/rust-tools.nvim",
}

-- Tmux integration, look here for tmux part https://github.com/mrjones2014/smart-splits.nvim#tmux-integration
use {
  "mrjones2014/smart-splits.nvim",
  config = function()
    require "user.plugins.smart-splits"
  end,
}

use {
  "ziglang/zig.vim",
}

use {
  "akinsho/toggleterm.nvim",
  config = function()
    require("toggleterm").setup {
      size = function(term)
        if term.direction == "horizontal" then
          return 15
        elseif term.direction == "vertical" then
          return vim.o.columns * 0.4
        end
      end,
      direction = "vertical",
    }

    vim.keymap.set({ "n", "t" }, "<C-`>", "<cmd>ToggleTerm<CR>", {})
  end,

  -- Which key
  use {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup()
    end,
  },
}

if packer_bootstrap then
  require("packer").sync()
end

require("packer").install()
pcall(require, "impatient")

for _, cfg in ipairs(_configs) do
  cfg()
end
