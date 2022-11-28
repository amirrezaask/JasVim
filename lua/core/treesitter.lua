_G.treesitter = {}

_G.treesitter.ensure = function(name)
  local ok, _ = pcall(require, "nvim-treesitter.install")
  if not ok then
    return
  end
  require("nvim-treesitter.install").ensure_installed(name)
end

plugin {
  "nvim-treesitter/nvim-treesitter",
  config = function()
    require("nvim-treesitter.configs").setup {
      highlight = {
        enable = true,
      },
      rainbow = {
        enable = true,
        extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
        max_file_lines = nil, -- Do not enable for files with more than n lines, int
      },
      textobjects = {
        move = {
          enable = true,
          set_jumps = true, -- whether to set jumps in the jumplist
          goto_next_start = {
            ["]m"] = "@function.outer",
            ["]]"] = "@class.outer",
          },
          goto_next_end = {
            ["]M"] = "@function.outer",
            ["]["] = "@class.outer",
          },
          goto_previous_start = {
            ["[m"] = "@function.outer",
            ["[["] = "@class.outer",
          },
          goto_previous_end = {
            ["[M"] = "@function.outer",
            ["[]"] = "@class.outer",
          },
        },
        select = {
          enable = true,

          -- Automatically jump forward to textobj, similar to targets.vim
          lookahead = true,

          keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
          },
        },
      },
    }
  end,
}

plugin {
  "nvim-treesitter/nvim-treesitter-textobjects",
  after = "nvim-treesitter",
}

plugin {
  "p00f/nvim-ts-rainbow",
  after = "nvim-treesitter",
}

plugin {
  "nvim-treesitter/nvim-treesitter-context",
  after = "nvim-treesitter",
  config = function()
    require("treesitter-context").setup {}
  end,
}
