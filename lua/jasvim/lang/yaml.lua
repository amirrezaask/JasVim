local M = {}

function M.configs()
  if jvim.plugin_exists "nvim-treesitter" then
    require("nvim-treesitter.install").ensure_installed "yaml"
  end
  if jvim.plugin_exists "lspconfig" then
    require("lspconfig").yamlls.setup {
      on_attach = require("jasvim.ide.lsp").on_attach,
    }
  end
end

function M.plugins()
  return { "cuducos/yaml.nvim" }
end

return M
