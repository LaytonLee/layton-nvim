return {
	"williamboman/mason.nvim",
	dependencies = {
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		require("mason").setup()

		require("mason-tool-installer").setup({
			--- LSPs
			"lua_ls",
			"gopls",
			"pyright",
			"ts_ls", -- typescript language server
			"tailwindcss",
			"nginx_language_server",

			--- Formatters/Linters (none-ls)
			"stylua",
			"prettier",
			"black",
			"isort",
			"gofmt",
			"nginx_beautifier",
			"eslint_d",
			"shfmt",

			--- Debuggers (DAP)
			"python",
			"delve", -- for go
		})
	end,
}
