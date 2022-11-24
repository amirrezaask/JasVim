local M = {}
function M.configs()
  if jvim.plugin_exists "nvim-treesitter" then
    require("nvim-treesitter.install").ensure_installed "haskell"
  end
  if jvim.plugin_exists "lspconfig" then
    require("lspconfig").hls.setup {
      on_attach = lsp.on_attach,
    }
  end
end

function M.plugins()
  return {}
end

return M
