return {
	{
		"jay-babu/mason-null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"nvimtools/none-ls.nvim",
		},
		config = function()
			require("mason-null-ls").setup({
				ensure_installed = { "stylua", "prettier", "black", "isort", "gofmt", "nginx_beautifier", "eslint_d", "shfmt" },
			})
		end,
	},
	{
		"nvimtools/none-ls.nvim",
		dependencies = {
			"nvimtools/none-ls-extras.nvim",
		},
		config = function()
			local null_ls = require("null-ls")

			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.stylua, -- for lua
					null_ls.builtins.formatting.prettier.with({
						extra_args = { "--trailing-comma", "none" },
					}), -- for vue, html, css ...
					null_ls.builtins.formatting.black, -- for python
					null_ls.builtins.formatting.isort, -- for python
					null_ls.builtins.formatting.gofmt, -- for go
					null_ls.builtins.formatting.nginx_beautifier, -- for nginx.conf
					null_ls.builtins.formatting.shfmt,
					require("none-ls.diagnostics.eslint_d"), -- for typescript, javascript
				},
			})

			vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
		end,
	},
}
