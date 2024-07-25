return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		vim.opt.termguicolors = true
		require("bufferline").setup({
			options = {
				offsets = {
					{
						filetype = "neo-tree",
						text = "File Explorer",
						highlight = "Directory",
						separator = true,
					},
				},
			},
		})

		vim.keymap.set("n", "<S-h>", ":BufferLineCycleNext<CR>", {})
		vim.keymap.set("n", "<S-l>", ":BufferLineCyclePrev<CR>", {})
	end,
}
