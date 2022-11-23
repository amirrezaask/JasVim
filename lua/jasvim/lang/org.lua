local M = {}

M.plugins = {
  { "nvim-treesitter/nvim-treesitter" },
  {
    "nvim-orgmode/orgmode",
    config = function()
      require("orgmode").setup {}
    end,
  },
}

function M.configs()
  require("orgmode").setup_ts_grammar()
  require("orgmode").setup {
    org_agenda_files = {},
    org_default_notes_file = "",
  }

end


return M
