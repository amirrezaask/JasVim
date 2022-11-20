jasvim.plugin { "ckipp01/stylua-nvim", run = "cargo install stylua" }
jasvim.plugin "folke/neodev.nvim"

jasvim.L("neodev").setup {}

local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

jasvim.L("nvim-treesitter.install").ensure_installed "lua"

jasvim.onsave("*.lua", function()
  jasvim.L("stylua-nvim").format_file()
end)

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*.lua",
  callback = function()
    vim.cmd [[ setlocal sts=2 sw=2 ]]
  end,
})

jasvim.L("lspconfig").sumneko_lua.setup {
  on_attach = lsp.on_attach,
  commands = {
    Format = {
      function()
        jasvim.L("stylua-nvim").format_file()
      end,
    },
  },
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}
