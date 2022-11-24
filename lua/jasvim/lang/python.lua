local M = {}

function M.configs()
  if jvim.plugin_exists "lspconfig" then
    require("lspconfig").jedi_language_server.setup {
      on_attach = lsp.on_attach,
    }
  end
end

function M.plugins()
  return { "Glench/Vim-Jinja2-Syntax" }
end

return M
