_G.window_height = function()
  return vim.api.nvim_win_get_height(0)
end

_G.window_width = function()
  return vim.api.nvim_win_get_width(0)
end

local _mt = {
  __call = function(tbl, name, user_opts)
    return function()
      local dropdown = require("telescope.themes").get_dropdown()

      local pickers_settings = {
        find_files = {
          theme = dropdown,
          layout_config = {
            height = math.ceil(window_height() * 0.5),
          },
        },
        oldfiles = {
          theme = dropdown,
        },
        git_files = {
          theme = dropdown,
        },
        live_grep = {
          preview = true,
          theme = dropdown,
        },
        help_tags = {
          theme = dropdown,
        },
        keymaps = {
          theme = dropdown,
        },
        colorschemes = {
          theme = dropdown,
        },
        commands = {
          theme = dropdown,
          prompt_title = "Command Palete",
          layout_config = {
            height = math.ceil(window_height() * 0.4),
          },
        },
        command_palete = {
          theme = dropdown,
          prompt_title = "Command Palete",
          layout_config = {
            height = math.ceil(window_height() * 0.4),
          },
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

function telescope.command_palete(opts)
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

function conf.telescope()
  if fuzzy_finder and fuzzy_finder ~= "telescope" then
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

  bind {
    n = {
      ["<leader><leader>"] = { telescope "find_files", desc = "Find Files" },
      ["<leader>ff"] = { telescope "find_files", desc = "Find Files" },
      ["<leader>fn"] = { telescope("find_files", { cwd = "~/.config/nvim" }), desc = "Neovim Config" },
      ["<leader>fg"] = { telescope "git_files", desc = "Git Files" },
      ["<leader>fr"] = { telescope "oldfiles", desc = "Recent Files" },
      ["<leader>fh"] = { telescope "help_tags", desc = "Help" },
      ["<leader>fk"] = { telescope "keymaps", desc = "Keymaps" },
      ["<leader>p"] = { telescope "command_palete", desc = "Command palete" },
      ["<leader>fc"] = { telescope "commands", desc = "Command palete" },
      ["??"] = telescope "live_grep",
    },
  }
end

plugin {
  "nvim-telescope/telescope.nvim",
  requires = { "nvim-lua/plenary.nvim" },
  config = conf.telescope,
}

plugin {
  "nvim-telescope/telescope-fzf-native.nvim",
  run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
  config = function()
    require("telescope").load_extension "fzf"
  end,
}
