local vue_language_server_path = ""
local ok, mason_registry = pcall(require, "mason-registry")

if ok and mason_registry.is_installed("vue-language-server") then
	vue_language_server_path = mason_registry.get_package("vue-language-server"):get_install_path()
		.. "/node_modules/@vue/language-server"
end

local vue_plugin = {
	name = "@vue/typescript-plugin",
	location = vue_language_server_path,
	languages = { "vue" },
	configNamespace = "typescript",
}

return {
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				lua_ls = {
					settings = {
						Lua = {
							hint = { enable = true },
						},
					},
				},
				gopls = {
					settings = {
						gopls = {
							hints = {
								assignVariableTypes = true,
								compositeLiteralFields = true,
								compositeLiteralTypes = true,
								constantValues = true,
								functionTypeParameters = true,
								parameterNames = true,
								rangeVariableTypes = true,
							},
						},
					},
				},

				pyright = {
					filetypes = { "python" },
					single_file_support = true,
					settings = {
						python = {
							analysis = {
								autoSearchPaths = true,
								diagnosticMode = "openFilesOnly",
								useLibraryCodeForTypes = true,
							},
						},
					},
				},

				ts_ls = {
					init_options = {
						plugins = { vue_plugin },
					},
					filetypes = {
						"javascript",
						"javascriptreact",
						"typescript",
						"typescriptreact",
						"vue",
					},
					single_file_support = true,
				},

				-- vue language server, require vtsls to support typescript
				vue_ls = {},
				vtsls = {
					settings = {
						vtsls = {
							tsserver = {
								globalPlugins = { vue_plugin },
							},
						},
					},
					filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
				},

				tailwindcss = {},
				nginx_language_server = {},

				-- bash language server
				bashls = {},
			},
		},
		config = function(_, opts)
			local lspconfig = vim.lsp.config
			for server, config in pairs(opts.servers) do
				config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
				lspconfig(server, config)
			end
			-- vue
			vim.lsp.enable({ "vtsls", "vue_ls" })

			vim.keymap.set("n", "gh", vim.lsp.buf.hover, {})

			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})

			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
			vim.keymap.set("n", "<leader>le", vim.diagnostic.open_float, {})

			-- keymap for inlay hint
			vim.keymap.set("n", "<leader>ch", function()
				if vim.lsp.inlay_hint.is_enabled() then
					vim.lsp.inlay_hint.enable(false, nil)
				else
					vim.lsp.inlay_hint.enable(true, nil)
				end
			end)
		end,
	},
}
