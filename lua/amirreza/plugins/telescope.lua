local nnoremap = vim.keymap.nnoremap
local dropdown_no_preview = require("telescope.themes").get_dropdown { previewer = false }

require("telescope").setup {}
require("telescope").load_extension "fzf"

nnoremap("<leader><leader>", function()
  require("telescope.builtin").find_files(dropdown_no_preview)
end)

nnoremap("<leader>ff", function()
  require("telescope.builtin").find_files(dropdown_no_preview)
end)

nnoremap("<leader>fb", function()
  require("telescope.builtin").buffers(dropdown_no_preview)
end)

nnoremap("<leader>fg", function()
  require("telescope.builtin").git_files(dropdown_no_preview)
end)

nnoremap("<C-p>", function()
  require("telescope.builtin").find_files(dropdown_no_preview)
end)

nnoremap("<leader>fs", function()
  require("telescope.builtin").live_grep()
end)

nnoremap("??", function()
  require("telescope.builtin").live_grep()
end)

nnoremap("<leader>fc", function()
  require("telescope.builtin").commands()
end)

nnoremap("<leader>fh", function()
  require("telescope.builtin").help_tags(dropdown_no_preview)
end)

-- Edit configurations
nnoremap("<C-9>", function()
  require("telescope.builtin").find_files(vim.tbl_extend("keep", { cwd = "~/dev/dotfiles" }, dropdown_no_preview))
end)
