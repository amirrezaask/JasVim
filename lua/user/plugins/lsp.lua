local lspconfig = require "lspconfig"

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

local function on_attach(_, bufnr)
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
end

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    on_attach(client, bufnr)
  end,
})

lspconfig["gopls"].setup {}
lspconfig["rust_analyzer"].setup {}
lspconfig["clangd"].setup {}
lspconfig["intelephense"].setup {}
lspconfig["phpactor"].setup {}
lspconfig["pyright"].setup {}
lspconfig["jedi_language_server"].setup {}

lspconfig["sumneko_lua"].setup {
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
}

lspconfig["jsonls"].setup {
  settings = {
    json = {
      schemas = require("schemastore").json.schemas(),
      validate = { enable = true },
    },
  },
}

require("null-ls").setup {
  sources = {
    require("null-ls").builtins.code_actions.gitsigns,
    require("null-ls").builtins.diagnostics.gitlint,
    require("null-ls").builtins.diagnostics.golangci_lint,
    require("null-ls").builtins.diagnostics.trail_space.with { disabled_filetypes = { "NvimTree" } },
    require("null-ls").builtins.formatting.stylua,
    require("null-ls").builtins.formatting.goimports,
  },
}

local autoformat_patterns = {
  "*.rs",
  "*.lua",
}

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = autoformat_patterns,
  callback = function(_)
    vim.lsp.buf.format()
  end,
})
