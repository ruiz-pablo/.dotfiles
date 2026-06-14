vim.api.nvim_create_user_command("Todo", ":e ~/todo.md", {})

vim.api.nvim_create_user_command("W", ":w", {})
vim.api.nvim_create_user_command("Wa", ":wa", {})
vim.api.nvim_create_user_command("Wq", ":wq", {})
vim.api.nvim_create_user_command("Q", ":q", {})
