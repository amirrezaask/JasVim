local M = {}

function M.configs()
  jvim.treesitter.ensure "python"
  jvim.lsp.config("jedi_language_server", {
    on_attach = lsp.on_attach,
  })
end

function M.plugins()
  return { "Glench/Vim-Jinja2-Syntax" }
end

return M
