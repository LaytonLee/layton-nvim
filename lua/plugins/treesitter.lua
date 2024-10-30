return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")
		configs.setup({
			ensure_installed = {
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
			},
			sync_install = false,
			highlight = {
				enable = true,
				disable = { "sql", "log" },
			},
			indent = { enable = true },
		})
	end,
}
