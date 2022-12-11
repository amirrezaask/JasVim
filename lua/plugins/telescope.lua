local nnoremap = vim.keymap.nnoremap
require("telescope").setup {}
require("telescope").load_extension "fzf"

nnoremap("<leader><leader>", function()
  require("telescope.builtin").find_files()
end)

nnoremap("<leader>ff", function()
  require("telescope.builtin").find_files()
end)

nnoremap("<leader>fb", function()
  require("telescope.builtin").buffers()
end)

nnoremap("<leader>fg", function()
  require("telescope.builtin").git_files()
end)

nnoremap("<C-p>", function()
  require("telescope.builtin").find_files()
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
  require("telescope.builtin").help_tags()
end)

-- Edit configurations
nnoremap("<C-9>", function()
  require("telescope.builtin").find_files { cwd = "~/.config/nvim" }
end)
