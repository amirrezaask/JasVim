local dropdown_no_preview = require("telescope.themes").get_dropdown { previewer = false }

require("telescope").setup {}
require("telescope").load_extension "fzf"

vim.keymap.set("n", "<leader><leader>", function()
  require("telescope.builtin").find_files(dropdown_no_preview)
end)

vim.keymap.set("n", "<leader>ff", function()
  require("telescope.builtin").find_files(dropdown_no_preview)
end)

vim.keymap.set("n", "<leader>fg", function()
  require("telescope.builtin").git_files(dropdown_no_preview)
end)

vim.keymap.set("n", "<leader>fs", function()
  require("telescope.builtin").live_grep()
end)

vim.keymap.set("n", "??", function()
  require("telescope.builtin").live_grep()
end)

vim.keymap.set("n", "<leader>fc", function()
  require("telescope.builtin").commands()
end)

vim.keymap.set("n", "<leader>fh", function()
  require("telescope.builtin").help_tags(dropdown_no_preview)
end)

-- Edit configurations
vim.keymap.set("n", "<leader>fd", function()
  require("telescope.builtin").find_files(vim.tbl_extend("keep", { cwd = "~/dev/dotfiles" }, dropdown_no_preview))
end)
