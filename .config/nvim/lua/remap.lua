vim.keymap.set("n", "<leader>n", ":cnext<CR>")
vim.keymap.set("n", "<leader>p", ":cprev<CR>")
vim.keymap.set("n", "<leader>b", ":ls<CR>:b ")
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>")
vim.keymap.set("n", "<leader>e", function()
	vim.cmd("Ex")
end)
vim.keymap.set("n", "<leader>r", function()
	vim.cmd("source $MYVIMRC")
end)
vim.keymap.set("n", "<leader>s", function()
	vim.cmd("source %")
end)
vim.keymap.set("n", "<ESC>", function()
	vim.cmd("noh")
end)

vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>d", '"_d')
vim.keymap.set("n", "L", function()
	vim.diagnostic.open_float()
end)

-- Remaps for Netrw
vim.api.nvim_create_autocmd("FileType", {
	pattern = "netrw",
	desc = "Custom remaps for Netrw",
	callback = function()
		vim.keymap.set("n", "l", "<CR>", { remap = true, buffer = true })
		vim.keymap.set("n", "h", "-", { remap = true, buffer = true })
	end,
})
