jasvim.plugin {
  "nvim-telescope/telescope.nvim",
  requires = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-file-browser.nvim" },
}
jasvim.plugin {
  "nvim-telescope/telescope-fzf-native.nvim",
  run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
}

local dropdown = jasvim.L("telescope.themes").get_dropdown()
local ivy = jasvim.L("telescope.themes").get_ivy()

local function get_default_telescope_picker_opts()
  return {
    find_files = {
      preview = false,
      theme = dropdown,
      layout_config = {
        height = math.ceil(jasvim.window_height() * 0.7),
      },
    },
    oldfiles = {
      preview = false,
      theme = dropdown,
      layout_config = {
        height = math.ceil(jasvim.window_height() * 0.7),
      },
    },
    git_files = {
      preview = false,
      theme = dropdown,
      layout_config = {
        height = math.ceil(jasvim.window_height() * 0.7),
      },
    },
    live_grep = {
      preview = true,
      layout_config = {
        height = math.ceil(jasvim.window_height() * 0.7),
      },
    },
    help_tags = {
      preview = false,
      theme = dropdown,
      layout_config = {
        height = math.ceil(jasvim.window_height() * 0.7),
      },
    },
    commands = {
      preview = false,
      theme = dropdown,
      layout_config = {
        height = math.ceil(jasvim.window_height() * 0.7),
      },
    },
  }
end

jasvim.L("telescope").setup {
  defaults = {
    preview = false,
    prompt_prefix = "🔍 ",
  },
  extensions = {
    file_browser = {
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = false,
      mappings = {
        ["i"] = {
          -- your custom insert mode mappings
        },
        ["n"] = {
          -- your custom normal mode mappings
        },
      },
    },
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = "smart_case", -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    },
  },
}
jasvim.L("telescope").load_extension "fzf"

local function telescope_wrap(builtin, picker_opts)
  return function()
    picker_opts = picker_opts or {}
    local opts = get_default_telescope_picker_opts()[builtin] or {}
    local theme = opts.theme or {}
    jasvim.L("telescope.builtin")[builtin](vim.tbl_extend("keep", opts, theme, picker_opts))
  end
end

bind {
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

jasvim.L("telescope").load_extension "file_browser"
