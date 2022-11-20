jasvim.plugin "b0o/schemastore.nvim"

require("nvim-treesitter.install").ensure_installed "json"
require("lspconfig").jsonls.setup {
  settings = {
    json = {
      schemas = require("schemastore").json.schemas(),
      validate = { enable = true },
    },
  },
}
