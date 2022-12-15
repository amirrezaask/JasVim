require("mason").setup()
require("mason-lspconfig").setup()

local ensure_installed = { "gitlint", "stylua", "golangci-lint", "goimports", "gofumpt", "yamlfmt" }
for _, pkg in ipairs(ensure_installed) do
  if not require("mason-registry").is_installed(pkg) then
    require("mason.api.command").MasonInstall { pkg }
  end
end
