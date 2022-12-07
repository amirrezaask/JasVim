local keymaps = require "core.keymaps"

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

keymaps.nnoremap("<leader>.", "<cmd>Explore<CR>")
