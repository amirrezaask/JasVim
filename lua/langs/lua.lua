plugin {
  "folke/neodev.nvim",
  requires = { "nvim-lua/plenary.nvim" },
  config = function()
    require("neodev").setup {}
  end,
}
plugin "milisims/nvim-luaref"
plugin "nanotee/luv-vimdocs"

treesitter.ensure "lua"

if config(langs, "autoformat", "lua.autoformat") then
  vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.lua",
    callback = function(_)
      vim.lsp.buf.format()
    end,
  })
end

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*.lua",
  callback = function()
    vim.cmd [[ setlocal sts=2 sw=2 ]]
  end,
})

lsp.config("sumneko_lua", {
  on_attach = lsp.on_attach,
  commands = {
    Format = {
      function()
        require("stylua-nvim").format_file()
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
})
