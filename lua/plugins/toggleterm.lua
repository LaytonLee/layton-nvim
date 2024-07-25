return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup()
		vim.keymap.set("n", "<Leader>tv", ":ToggleTerm size=80 direction=vertical<CR>", {})
		vim.keymap.set("n", "<Leader>th", ":ToggleTerm size=10 direction=horizontal<CR>", {})
		vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], {})
		vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], {})
		vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], {})
		vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], {})
	end,
}
