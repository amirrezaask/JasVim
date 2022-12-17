vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

vim.api.nvim_create_user_command("Gp", function()
  vim.cmd.Git "push"
end, {})
