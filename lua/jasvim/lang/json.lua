local M = {}

function M.plugins()
  return { "b0o/schemastore.nvim" }
end

function M.configs()
  if jasvim.lang.has_treesitter "json" then
    jasvim.treesitter.ensure "json"
  end
  if jasvim.lang.has_lsp "json" then
    jasvim.lsp.config("jsonls", {
      settings = {
        json = {
          schemas = require("schemastore").json.schemas(),
          validate = { enable = true },
        },
      },
    })
  end
end
return M
