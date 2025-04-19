return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
	},
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua, -- for lua
				null_ls.builtins.formatting.prettier, -- for vue, html, css ...
				null_ls.builtins.formatting.black, -- for python
				null_ls.builtins.formatting.isort, -- for python
				null_ls.builtins.formatting.gofmt, -- for go
				null_ls.builtins.formatting.nginx_beautifier, -- for nginx.conf
				require("none-ls.diagnostics.eslint_d"), -- for typescript, javascript
			},
		})

		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
