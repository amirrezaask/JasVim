local _mt = {
  __call = function(tbl, name, user_opts)
    return function()
      local opts = tbl.get_default_telescope_picker_opts()[name] or {}
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

local M = setmetatable({}, _mt)

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
function M.command_palete(opts)
  local pickers = require "telescope.pickers"
  local finders = require "telescope.finders"
  local conf = require("telescope.config").values
  local actions = require "telescope.actions"
  local action_state = require "telescope.actions.state"
  local utils = require "telescope.utils"
  local make_entry = require "telescope.make_entry"
  opts = opts or {}
  pickers
    .new(opts, {
      prompt_title = "Commands" or opts.title,
      finder = finders.new_table {
        results = (function()
          local command_iter = vim.api.nvim_get_commands {}
          local commands = {}

          for _, cmd in pairs(command_iter) do
            if opts.pattern then
              if string.sub(cmd.name, 0, #opts.pattern) == opts.pattern then
                table.insert(commands, cmd)
              end
            else
              table.insert(commands, cmd)
            end
          end

          local need_buf_command = vim.F.if_nil(opts.show_buf_command, true)

          if need_buf_command then
            local buf_command_iter = vim.api.nvim_buf_get_commands(0, {})
            buf_command_iter[true] = nil -- remove the redundant entry
            for _, cmd in pairs(buf_command_iter) do
              table.insert(commands, cmd)
            end
          end
          return commands
        end)(),

        entry_maker = opts.entry_maker or make_entry.gen_from_commands(opts),
      },
      sorter = conf.generic_sorter(opts),
      attach_mappings = function(prompt_bufnr)
        actions.select_default:replace(function()
          local selection = action_state.get_selected_entry()
          if selection == nil then
            utils.__warn_no_selection "builtin.commands"
            return
          end

          actions.close(prompt_bufnr)
          local val = selection.value
          local cmd = string.format([[:%s ]], val.name)

          if val.nargs == "0" then
            vim.cmd(cmd)
          else
            vim.cmd [[stopinsert]]
            vim.fn.feedkeys(cmd, "n")
          end
        end)

        return true
      end,
    })
    :find()
end
function M.get_default_telescope_picker_opts()
  local dropdown = require("telescope.themes").get_dropdown()
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
      prompt_title = "Command Palete",
    },
  }
end

function M.configs()
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

  jasvim.bind {
    n = {
      ["<leader><leader>"] = { M "find_files", desc = "Find Files" },
      ["<leader>ff"] = { M "find_files", desc = "Find Files" },
      ["<leader>fd"] = { M("find_files", { cwd = "~/dev/dotfiles" }), desc = "Find Dotfile" },
      ["<leader>fg"] = { M "git_files", desc = "Git Files" },
      ["<leader>fr"] = { M "oldfiles", desc = "Recent Files" },
      ["<leader>fh"] = { M "help_tags", desc = "Help" },
      ["<leader>p"] = { M "command_palete", desc = "Command palete" },
      ["<leader>fc"] = { M "commands", desc = "Command palete" },
      ["??"] = M "live_grep",
    },
  }
end

return M
