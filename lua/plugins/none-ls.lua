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
				ensure_installed = {},
			})
		end,
	},
	{
		"nvimtools/none-ls.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
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
					null_ls.builtins.formatting.shfmt, -- for bash

					-- for typescript, javascript
					-- need to initialize eslint in the working directory by execute:
					--   npm init @eslint/config@latest
					require("none-ls.diagnostics.eslint_d"),
				},
			})

			vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, {}) -- code format
		end,
	},
}
