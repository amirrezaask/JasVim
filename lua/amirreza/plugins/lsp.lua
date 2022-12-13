local lsp = require "lsp-zero"

lsp.preset "recommended"

lsp.set_preferences {
  suggest_lsp_servers = false,
}

lsp.nvim_workspace {
  library = vim.api.nvim_get_runtime_file("", true),
}

lsp.ensure_installed {
  "gopls",
  "rust_analyzer",
  "sumneko_lua",
  "clangd",
  "jsonls",
  "intelephense",
  "phpactor",
  "pyright",
  "jedi_language_server",
}

lsp.on_attach(function(_, bufnr)
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
  local buffer = { buffer = bufnr }
  local nnoremap = vim.keymap.nnoremap
  local inoremap = vim.keymap.inoremap
  nnoremap("gd", vim.lsp.buf.definition, buffer)
  nnoremap("gD", vim.lsp.buf.declaration, buffer)
  nnoremap("gi", vim.lsp.buf.implementation, buffer)
  nnoremap("gr", vim.lsp.buf.references, buffer)
  nnoremap("R", vim.lsp.buf.rename, buffer)
  nnoremap("<F2>", vim.lsp.buf.rename, buffer)
  nnoremap("K", vim.lsp.buf.hover, buffer)
  nnoremap("gf", vim.lsp.buf.format, buffer)

  nnoremap("gl", vim.diagnostic.open_float, buffer)
  nnoremap("gp", vim.diagnostic.goto_prev, buffer)
  nnoremap("gn", vim.diagnostic.goto_next, buffer)

  nnoremap("C", vim.lsp.buf.code_action, buffer)
  nnoremap("<C-s>", vim.lsp.buf.signature_help, buffer)
  inoremap("<C-s>", vim.lsp.buf.signature_help, buffer)
end)

lsp.configure("sumneko_lua", {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
      telemetry = {
        enable = false,
      },
    },
  },
})

lsp.configure("jsonls", {
  settings = {
    json = {
      schemas = require("schemastore").json.schemas(),
      validate = { enable = true },
    },
  },
})

lsp.setup()

local null_opts = lsp.build_options("null-ls", {})

require("null-ls").setup {
  on_attach = null_opts.on_attach,
  sources = {
    require("null-ls").builtins.code_actions.gitsigns,
    require("null-ls").builtins.diagnostics.gitlint,
    require("null-ls").builtins.diagnostics.golangci_lint,
    require("null-ls").builtins.diagnostics.trail_space.with { disabled_filetypes = { "NvimTree" } },
    require("null-ls").builtins.formatting.stylua,
    require("null-ls").builtins.formatting.goimports,
  },
}

local mason = {
  name = "amirreza",
}

function mason.ensure_installed(to_install)
  for _, pkg in ipairs(to_install) do
    if not require("mason-registry").is_installed(pkg) then
      require("mason.api.command").MasonInstall { pkg }
    end
  end
end

mason.ensure_installed { "gitlint", "stylua", "golangci-lint", "goimports", "gofumpt", "yamlfmt" }

-- Lua autoformat
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.lua",
  callback = function(_)
    vim.lsp.buf.format()
  end,
})
