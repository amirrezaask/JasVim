local M = {}

function M.configs()
  require("nvim-treesitter.install").ensure_installed "yaml"
  require("lspconfig").yamlls.setup {
    on_attach = require("jasvim.ide.lsp").on_attach,
  }
end

function M.plugins()
  return { "cuducos/yaml.nvim" }
end

return M
