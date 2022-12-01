plugin {
  "jose-elias-alvarez/null-ls.nvim",
  config = function()
    require("null-ls").setup {
      sources = {
        require("null-ls").builtins.code_actions.gitsigns,
        require("null-ls").builtins.diagnostics.gitlint,
        require("null-ls").builtins.diagnostics.trail_space.with { disabled_filetypes = { "NvimTree" } },
        require("null-ls").builtins.formatting.stylua,
        require("null-ls").builtins.formatting.goimports,
      },
    }
  end,
}
