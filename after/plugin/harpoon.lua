require("telescope").load_extension "harpoon"
require("amirrezaask.keymaps").bind {
  n = {
    ["<leader>hm"] = require("harpoon.ui").toggle_quick_menu,
    ["<leader>ha"] = require("harpoon.mark").add_file,
    ["<leader>h1"] = function()
      require("harpoon.ui").nav_file(1)
    end,
    ["<leader>h2"] = function()
      require("harpoon.ui").nav_file(2)
    end,
    ["<leader>h3"] = function()
      require("harpoon.ui").nav_file(3)
    end,
    ["<leader>h4"] = function()
      require("harpoon.ui").nav_file(4)
    end,
    ["<leader>hn"] = function()
      require("harpoon.ui").nav_next()
    end,
    ["<leader>hp"] = function()
      require("harpoon.ui").nav_prev()
    end,
  },
}
