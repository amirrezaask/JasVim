use {
  "nvim-telescope/telescope.nvim",
  requires = { "nvim-lua/plenary.nvim" },
}

use {
  "nvim-telescope/telescope-fzf-native.nvim",
  run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
}

_G.window_height = function()
  return vim.api.nvim_win_get_height(0)
end

_G.window_width = function()
  return vim.api.nvim_win_get_width(0)
end

local _mt = {
  __call = function(tbl, name, user_opts)
    return function()
      local pickers_settings = {
        live_grep = {
          preview = true,
        },
        help_tags = {
          preview = true,
        },
      }
      local opts = pickers_settings[name] or {}
      user_opts = user_opts or {}
      local theme = opts.theme or {}
      if tbl[name] then
        tbl[name](vim.tbl_extend("keep", user_opts, opts, theme))
      else
        require("telescope.builtin")[name](vim.tbl_extend("keep", user_opts, opts, theme))
      end
    end
  end,
}

_G.telescope = setmetatable({}, _mt)

function configs.telescope()
  if _G.plugins.fuzzy_finder ~= "telescope" then
    return
  end
  require("telescope").setup {
    defaults = {
      preview = false,
      prompt_prefix = "🔍 ",
      layout_config = {
        height = math.ceil(window_height() * 0.7),
      },
    },
    extensions = {
      fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = "smart_case",
      },
    },
  }

  require("core.keymaps").bind {
    n = {
      ["<leader><leader>"] = { telescope "find_files", desc = "Find Files" },
      ["<leader>ff"] = { telescope "find_files", desc = "Find Files" },
      ["<leader>fn"] = { telescope("find_files", { cwd = "~/.config/nvim" }), desc = "Neovim Config" },
      ["<leader>fg"] = { telescope "git_files", desc = "Git Files" },
      ["<leader>fr"] = { telescope "oldfiles", desc = "Recent Files" },
      ["<leader>fh"] = { telescope "help_tags", desc = "Help" },
      ["<leader>fk"] = { telescope "keymaps", desc = "Keymaps" },
      ["<leader>p"] = { telescope "commands", desc = "Command palete" },
      ["<leader>fc"] = { telescope "commands", desc = "Command palete" },
      ["??"] = { telescope "live_grep", desc = "Live Grep" },
    },
  }

  require("telescope").load_extension "fzf"
end
