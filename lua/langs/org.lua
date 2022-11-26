plugin {
  "nvim-orgmode/orgmode",
  requires = { "nvim-treesitter/nvim-treesitter" },
  config = function()
    require("orgmode").setup_ts_grammar()
    require("orgmode").setup {
      org_agenda_files = {},
      org_default_notes_file = "",
    }
  end,
}
