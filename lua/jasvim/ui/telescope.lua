local M = {}

function M.plugins()
  return {
    {
      "nvim-telescope/telescope.nvim",
      requires = { "nvim-lua/plenary.nvim" },
    },
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
    },
  }
end

function M.configs()
  local dropdown = require("telescope.themes").get_dropdown()

  local function get_default_telescope_picker_opts()
    return {
      find_files = {
        theme = dropdown,
      },
      oldfiles = {
        theme = dropdown,
      },
      git_files = {
        theme = dropdown,
      },
      live_grep = {
        preview = true,
      },
      help_tags = {
        theme = dropdown,
      },
      commands = {
        theme = dropdown,
      },
    }
  end

  require("telescope").setup {
    defaults = {
      preview = false,
      prompt_prefix = "🔍 ",
      layout_config = {
        center = {
          height = math.ceil(jasvim.window_height() * 0.8),
        },
      },
    },
    extensions = {
      fzf = {
        fuzzy = true, -- false will only do exact matching
        override_generic_sorter = true, -- override the generic sorter
        override_file_sorter = true, -- override the file sorter
        case_mode = "smart_case", -- or "ignore_case" or "respect_case"
        -- the default case_mode is "smart_case"
      },
    },
  }
  require("telescope").load_extension "fzf"

  local function telescope_wrap(builtin, picker_opts)
    return function()
      picker_opts = picker_opts or {}
      local opts = get_default_telescope_picker_opts()[builtin] or {}
      local theme = opts.theme or {}
      require("telescope.builtin")[builtin](vim.tbl_extend("keep", opts, theme, picker_opts))
    end
  end

  jasvim.bind {
    n = {
      ["<leader><leader>"] = { telescope_wrap "find_files", desc = "Find Files" },
      ["<leader>ff"] = { telescope_wrap "find_files", desc = "Find Files" },
      ["<leader>fd"] = { telescope_wrap("find_files", { cwd = "~/dev/dotfiles" }), desc = "Find Dotfile" },
      ["<leader>fg"] = { telescope_wrap "git_files", desc = "Git Files" },
      ["<leader>fr"] = { telescope_wrap "oldfiles", desc = "Recent Files" },
      ["<leader>fh"] = { telescope_wrap "help_tags", desc = "Help" },
      ["<leader>fc"] = { telescope_wrap "commands", desc = "Commands" },

      ["??"] = telescope_wrap "live_grep",
    },
  }
end
return M
