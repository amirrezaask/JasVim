local M = {}

function M.plugins()
  return { "b0o/schemastore.nvim" }
end

function M.configs()
  if jvim.plugin_exists "nvim-treesitter" then
    require("nvim-treesitter.install").ensure_installed "json"
  end
  if jvim.plugin_exists "lspconfig" then
    require("lspconfig").jsonls.setup {
      settings = {
        json = {
          schemas = require("schemastore").json.schemas(),
          validate = { enable = true },
        },
      },
    }
  end
end
return M
