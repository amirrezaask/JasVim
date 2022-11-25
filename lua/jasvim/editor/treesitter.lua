local M = {}
function M.plugins()
  return {
    "nvim-treesitter/nvim-treesitter",
    { "nvim-treesitter/nvim-treesitter-textobjects", requires = { "nvim-treesitter/nvim-treesitter" } },
    { "nvim-treesitter/nvim-treesitter-context", requires = { "nvim-treesitter/nvim-treesitter" } },
    { "p00f/nvim-ts-rainbow", requires = { "nvim-treesitter/nvim-treesitter" } },
  }
end

jasvim.treesitter = {}

function jasvim.treesitter.ensure(name)
  jasvim.with("nvim-treesitter.install", function(ts)
    ts.ensure_installed(name)
  end)
end

function M.configs()
  if not jasvim.plugin_exists "nvim-treesitter" then
    return
  end
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

  jasvim.with("treesitter-context", function(ts_context)
    ts_context.setup {}
  end)
end
return M
