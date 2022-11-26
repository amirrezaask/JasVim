plugin {
  "b0o/schemastore.nvim",
  config = function()
    lsp.config("jsonls", {
      settings = {
        json = {
          schemas = require("schemastore").json.schemas(),
          validate = { enable = true },
        },
      },
    })
  end,
}

treesitter.ensure "json"
