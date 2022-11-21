local M = {}

function M.plugins()
  return {
"nvim-lua/plenary.nvim",
    "folke/neodev.nvim",
  }
end

function M.configs()
  require("neodev").setup {}

  local runtime_path = vim.split(package.path, ";")
  table.insert(runtime_path, "lua/?.lua")
  table.insert(runtime_path, "lua/?/init.lua")

  require("nvim-treesitter.install").ensure_installed "lua"

  vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = "*.lua",
    callback = function(opts)
      local buf = opts.buf
      local Job = require "plenary.job"
      local j = Job:new {
        "stylua",
        "-",
        writer = vim.api.nvim_buf_get_lines(0, 0, -1, false),
      }
      local output = j:sync()
      if j.code ~= 0 then
        vim.schedule(function()
          print "[stylua] Failed to process due to errors"
        end)
      end
      vim.api.nvim_buf_set_lines(buf, 0, -1, false, output)
    end,
  })
  vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*.lua",
    callback = function()
      vim.cmd [[ setlocal sts=2 sw=2 ]]
    end,
  })

  require("lspconfig").sumneko_lua.setup {
    on_attach = lsp.on_attach,
    commands = {
      Format = {
        function()
          require("stylua-nvim").format_file()
        end,
      },
    },
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" },
        },
        workspace = {
          -- Make the server aware of Neovim runtime files
          library = vim.api.nvim_get_runtime_file("", true),
          checkThirdParty = false,
        },
        -- Do not send telemetry data containing a randomized but unique identifier
        telemetry = {
          enable = false,
        },
      },
    },
  }
end
return M
