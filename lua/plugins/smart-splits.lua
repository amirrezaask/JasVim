plugin {
  "mrjones2014/smart-splits.nvim",
  config = function()
    -- smart split
    require("smart-splits").setup {}
    bind {
      n = {
        ["<A-h>"] = require("smart-splits").resize_left,
        ["<A-j>"] = require("smart-splits").resize_down,
        ["<A-k>"] = require("smart-splits").resize_up,
        ["<A-l>"] = require("smart-splits").resize_right,

        ["<C-h>"] = require("smart-splits").move_cursor_left,
        ["<C-j>"] = require("smart-splits").move_cursor_down,
        ["<C-k>"] = require("smart-splits").move_cursor_up,
        ["<C-l>"] = require("smart-splits").move_cursor_right,
      },
      t = {
        ["<A-h>"] = require("smart-splits").resize_left,
        ["<A-j>"] = require("smart-splits").resize_down,
        ["<A-k>"] = require("smart-splits").resize_up,
        ["<A-l>"] = require("smart-splits").resize_right,
      },
    }
  end,
}
