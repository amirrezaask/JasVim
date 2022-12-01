local asciiart = ""
if cfg(plugins, "alpha.asciiart") then
  asciiart = cfg(plugins, "alpha.asciiart")
else
  asciiart = [[
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣾⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣴⣿⣿⣿⣿⣦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⡿⢿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⢀⣠⣤⣶⣶⣷⣶⣦⣤⣀⠘⢿⣿⡇⢸⣿⡿⠃⣀⣤⣴⣶⣶⣶⣶⣤⣄⡀⠀
⠀⠈⢿⣿⣿⣿⣿⣿⡿⣿⣿⣷⣄⠘⠇⠸⠁⣠⣾⣿⣿⢿⣿⣿⣿⣿⣿⡿⠁⠀
⠀⠀⠈⢻⣿⣿⣿⣿⣦⣤⣈⡉⠛⢁⣤⣤⡈⠛⢉⣁⣤⣼⣿⣿⣿⣿⠟⠀⠀⠀
⠀⠀⠀⠀⠉⠛⠿⠿⢿⠿⠋⣉⣀⠸⣿⣿⠇⠸⠿⣿⣿⡿⠿⠿⠛⠁⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⣿⣿⠋⣠⠀⣤⡄⠐⣶⣤⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⢀⣴⣿⣿⡿⢁⣴⣿⠀⢿⣿⣦⡘⢿⣿⣿⣦⡀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⣼⣿⣿⣿⣿⣿⣿⡿⠁⠘⣿⣿⣿⣿⣿⣿⣿⣷⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⡿⠁⠀⠀⠈⢿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⢹⣿⠿⠿⠛⠉⠀⠀⠀⠀⠀⠀⠉⠛⠿⠿⣿⡟⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
]]
end

function configs.alpha()
  local ascii_art = vim.split(asciiart, "\n")
  local button = require("alpha.themes.dashboard").button
  local myconfig = {
    layout = {
      { type = "padding", val = 2 },
      {
        type = "text",
        -- val = asciiarts[math.ceil(math.random(1, 100) % 2) + 1],
        val = ascii_art,
        opts = { position = "center", hl = "Type" },
      },
      { type = "padding", val = 2 },
      -- { type = "text", val = jasvim.version, opts = { position = "center", hl = "Type" } },
      { type = "padding", val = 2 },
      {
        type = "group",
        val = {
          button("SPC SPC", "  Find file"),
          button("SPC f g", "  Git files"),
          button("??", "  Live Grep"),
          button("SPC f r", "  Recent Files"),
          button("SPC p s", "  Sync Packages", "<cmd>PackerSync<Cr>"),
        },
        opts = { spacing = 1, hl = "Include" },
      },
      { type = "padding", val = 2 },
      {
        type = "text",
        val = string.format("Neovim version %s.%s", vim.version().major, vim.version().minor),
        opts = { position = "center", hl = "Type" },
      },
    },
  }
  require("alpha").setup(myconfig)
  bind {
    n = {
      [",z"] = { "<cmd>MaximizerToggle<cr>", desc = "Toggle zoom on current window" },
    },
  }
end

if cfg(plugins, "alpha.enabled") == true then
  use {
    "goolord/alpha-nvim",
    requires = { "kyazdani42/nvim-web-devicons" },
  }
end
