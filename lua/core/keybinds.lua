vim.keymap.set(
	"n", "<leader>e", "<cmd>Lex<CR>", { desc = "toggle explorer" }
)
vim.keymap.set(
	"n", "<leader>cf", "<cmd>lua vim.lsp.buf.format()<CR>", { desc = "Code Format" }
)
