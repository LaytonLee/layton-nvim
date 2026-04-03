return {
	"saghen/blink.cmp",
	dependencies = { "rafamadriz/friendly-snippets" },

	version = "*",

	opts = {
		keymap = {
			preset = "default",

			["<Tab>"] = { "select_next", "fallback" },
			["<CR>"] = { "accept", "fallback" },

			["<C-u>"] = { "scroll_signature_up", "fallback" },
			["<C-d>"] = { "scroll_signature_down", "fallback" },

			-- default in all keymap preset, just for remember
			["<C-k>"] = { "show_signature", "hide_signature", "fallback" },
		},

		appearance = {
			nerd_font_variant = "mono",
		},

		completion = {
			-- (Default) Only show the documentation popup when manually triggered
			documentation = { auto_show = false },

			list = {
				selection = {
					-- This is the "magic" setting:
					-- 'preselect' = first item is highlighted immediately
					-- 'manual' = nothing is highlighted until you move into the list
					preselect = false,
					auto_insert = false,
				},
			},

			menu = {
				-- This defines the look of the completion menu
				draw = {
					columns = {
						-- Column 1: The icon (kind) and the name of the suggestion
						-- Column 2: The source of the suggestion (LSP, Buffer, etc)
						{ "kind_icon", "label", gap = 1 },
						{ "source_name" },
					},
				},
			},
		},

		signature = { enabled = true },

		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},

		fuzzy = { implementation = "prefer_rust_with_warning" },
	},
	opts_extend = { "sources.default" },
}
