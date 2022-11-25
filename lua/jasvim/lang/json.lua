local M = {}

function M.plugins()
  return { "b0o/schemastore.nvim" }
end

function M.configs()
  jvim.treesitter.ensure "json"
  jvim.lsp.config("jsonls", {
    settings = {
      json = {
        schemas = require("schemastore").json.schemas(),
        validate = { enable = true },
      },
    },
  })
end
return M
