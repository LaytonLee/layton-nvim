return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter").install({
			"rust",
			"c",
			"lua",
			"vim",
			"vimdoc",
			"css",
			"go",
			"java",
			"python",
			"javascript",
			"typescript",
			"tsx",
			"html",
			"css",
		}):wait(300000)
	end,
}
