local M = {}

function M.plugins()
  return {}
end

function M.configs()
  jvim.treesitter.ensure "php"
  if jvim.plugin_exists "nvim-treesitter" then
    require("nvim-treesitter.install").ensure_installed "php"
  end
  jvim.lsp.config("intelephense", {
    on_attach = lsp.on_attach,
  })
end

return M
