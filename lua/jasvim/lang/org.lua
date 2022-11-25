local M = {}

function M.plugins()
  return {
    "nvim-orgmode/orgmode",
    requires = { "nvim-treesitter/nvim-treesitter" },
  }
end

function M.configs()
  if not jasvim.plugin_exists "orgmode" then
    return
  end

  require("orgmode").setup_ts_grammar()
  require("orgmode").setup {
    org_agenda_files = {},
    org_default_notes_file = "",
  }
end

return M
