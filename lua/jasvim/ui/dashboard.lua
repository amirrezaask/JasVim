local M = {}
function M.plugins()
  return {
    {
      "goolord/alpha-nvim",
      requires = { "kyazdani42/nvim-web-devicons" },
    },
  }
end

function M.configs()
  if not jasvim.plugin_exists "alpha" then
    return
  end
  if jvim.start_screen == false then
    return
  end
  local asciiarts = {
    vim.split(
      [[
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
]],
      "\n"
    ),

    vim.split(
      [[
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠁⠙⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠋⠀⠀⠀⠀⠙⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⢀⡀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⡿⠟⠛⠉⠉⠈⠉⠙⠛⠿⣧⡀⠀⢸⡇⠀⢀⣼⠿⠛⠋⠉⠉⠉⠉⠛⠻⢿⣿
⣿⣷⡀⠀⠀⠀⠀⠀⢀⠀⠀⠈⠻⣧⣸⣇⣾⠟⠁⠀⠀⡀⠀⠀⠀⠀⠀⢀⣾⣿
⣿⣿⣷⡄⠀⠀⠀⠀⠙⠛⠷⢶⣤⡾⠛⠛⢷⣤⡶⠾⠛⠃⠀⠀⠀⠀⣠⣿⣿⣿
⣿⣿⣿⣿⣶⣤⣀⣀⡀⣀⣴⠶⠿⣇⠀⠀⣸⣇⣀⠀⠀⢀⣀⣀⣤⣾⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⡿⠋⠀⠀⣴⠟⣿⠛⢻⣯⠉⠛⠛⢿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⡿⠋⠀⠀⢀⡾⠋⠀⣿⡀⠀⠙⢧⡀⠀⠀⠙⢿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⠃⠀⠀⠀⠀⠀⠀⢀⣾⣧⠀⠀⠀⠀⠀⠀⠀⠈⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⢀⣾⣿⣿⣷⡀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⡆⠀⣀⣀⣤⣶⣿⣿⣿⣿⣿⣿⣶⣤⣀⣀⠀⢠⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
  ]],
      "\n"
    ),
  }
  math.randomseed(os.clock() * 100000000000)
  local button = require("alpha.themes.dashboard").button
  local myconfig = {
    layout = {
      { type = "padding", val = 2 },
      {
        type = "text",
        -- val = asciiarts[math.ceil(math.random(1, 100) % 2) + 1],
        val = asciiarts[1],
        opts = { position = "center", hl = "Type" },
      },
      { type = "padding", val = 2 },
      { type = "text", val = "JasVim", opts = { position = "center", hl = "Type" } },
      { type = "padding", val = 1 },
      { type = "text", val = jasvim.version, opts = { position = "center", hl = "Type" } },
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
  jasvim.bind {
    n = {
      [",z"] = { "<cmd>MaximizerToggle<cr>", desc = "Toggle zoom on current window" },
    },
  }
end

return M
