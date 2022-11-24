local M = {}

function M.plugins()
  return {
    { "folke/neodev.nvim", requires = { "nvim-lua/plenary.nvim" } },
  }
end

function M.configs()
  if jvim.plugin_exists "neodev" then
    require("neodev").setup {}
  end

  local runtime_path = vim.split(package.path, ";")
  table.insert(runtime_path, "lua/?.lua")
  table.insert(runtime_path, "lua/?/init.lua")

  if jvim.plugin_exists "nvim-treesitter" then
    require("nvim-treesitter.install").ensure_installed "lua"
  end

  vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.lua",
    callback = function(opts)
      if not jvim.plugin_exists "plenary" then
        return
      end
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
        return
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

  if not jvim.plugin_exists "lspconfig" then
    return
  end
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
