local M = {}

function M.plugins()
  return { "b0o/schemastore.nvim" }
end

function M.configs()
  require("nvim-treesitter.install").ensure_installed "json"
  require("lspconfig").jsonls.setup {
    settings = {
      json = {
        schemas = require("schemastore").json.schemas(),
        validate = { enable = true },
      },
    },
  }
end
return M
