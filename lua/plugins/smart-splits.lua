local nnoremap = vim.keymap.nnoremap

local tnoremap = vim.keymap.tnoremap

require("smart-splits").setup {}

nnoremap("<A-h>", require("smart-splits").resize_left)
nnoremap("<A-j>", require("smart-splits").resize_down)
nnoremap("<A-k>", require("smart-splits").resize_up)
nnoremap("<A-l>", require("smart-splits").resize_right)

nnoremap("<C-h>", require("smart-splits").move_cursor_left)
nnoremap("<C-j>", require("smart-splits").move_cursor_down)
nnoremap("<C-k>", require("smart-splits").move_cursor_up)
nnoremap("<C-l>", require("smart-splits").move_cursor_right)

tnoremap("<A-h>", require("smart-splits").resize_left)
tnoremap("<A-j>", require("smart-splits").resize_down)
tnoremap("<A-k>", require("smart-splits").resize_up)
tnoremap("<A-l>", require("smart-splits").resize_right)

tnoremap("<C-h>", require("smart-splits").move_cursor_left)
tnoremap("<C-j>", require("smart-splits").move_cursor_down)
tnoremap("<C-k>", require("smart-splits").move_cursor_up)
tnoremap("<C-l>", require("smart-splits").move_cursor_right)
