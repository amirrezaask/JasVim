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

if langs.autoformat and langs.lua and langs.lua.autoformat then
  vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.lua",
    callback = function(opts)
      local ok, _ = pcall(require, "plenary")
      if not ok then
        return
      end
      local buf = opts.buf
      local Job = require "plenary.job"
      local j = Job:new {
        "stylua",
        "-",
        writer = vim.api.nvim_buf_get_lines(0, 0, -1, false),
      }
      local output = j:sync()
      if j.code ~= 0 then
        vim.schedule(function()
          print "[stylua] Failed to process due to errors"
        end)
        return
      end
      vim.api.nvim_buf_set_lines(buf, 0, -1, false, output)
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
