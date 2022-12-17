local lsp = require "lsp-zero"

lsp.preset "recommended"

lsp.set_preferences {
  suggest_lsp_servers = true,
  sign_icons = {
    error = "E",
    warn = "W",
    hint = "H",
    info = "I",
  },
}
lsp.ensure_installed {
  "gopls",
  "sumneko_lua",
  "rust_analyzer",
}

lsp.on_attach(function(_, bufnr)
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
  local buffer = { buffer = bufnr }
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, buffer)
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, buffer)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, buffer)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, buffer)
  vim.keymap.set("n", "R", vim.lsp.buf.rename, buffer)
  vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, buffer)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, buffer)
  vim.keymap.set("n", "gf", vim.lsp.buf.format, buffer)

  vim.keymap.set("n", "gl", vim.diagnostic.open_float, buffer)
  vim.keymap.set("n", "gp", vim.diagnostic.goto_prev, buffer)
  vim.keymap.set("n", "gn", vim.diagnostic.goto_next, buffer)

  vim.keymap.set("n", "C", vim.lsp.buf.code_action, buffer)
  vim.keymap.set("n", "<C-s>", vim.lsp.buf.signature_help, buffer)
  vim.keymap.set("i", "<C-s>", vim.lsp.buf.signature_help, buffer)
end)

lsp.nvim_workspace()

lsp.setup()

vim.diagnostic.config {
  virtual_text = true,
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

require("null-ls").setup {
  sources = {
    require("null-ls").builtins.code_actions.gitsigns,
    require("null-ls").builtins.diagnostics.golangci_lint,
    require("null-ls").builtins.diagnostics.trail_space.with { disabled_filetypes = { "NvimTree" } },
    require("null-ls").builtins.formatting.stylua,
    require("null-ls").builtins.formatting.goimports,
  },
}

local mason_ensure_installed = { "stylua", "golangci-lint", "goimports", "gofumpt", "yamlfmt" }
for _, pkg in ipairs(mason_ensure_installed) do
  if not require("mason-registry").is_installed(pkg) then
    require("mason.api.command").MasonInstall { pkg }
  end
end

local virtual_text = true
vim.api.nvim_create_user_command("VirtualTextToggle", function()
  virtual_text = not virtual_text
  vim.diagnostic.config {
    virtual_text = virtual_text,
  }
end, {})

require("fidget").setup {}
