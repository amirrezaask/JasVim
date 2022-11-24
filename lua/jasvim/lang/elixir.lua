local M = {}

function M.plugins()
  return {}
end
function M.configs()
  if jvim.plugin_exists "nvim-treesitter" then
    require("nvim-treesitter.install").ensure_installed "elixir"
  end
  if jvim.plugin_exists "lspconfig" then
    require("lspconfig").elixirls.setup {
      on_attach = lsp.on_attach,
      cmd = { os.getenv "HOME" .. "/.local/elixir-ls/language_server.sh" },
    }
  end
end

return M
