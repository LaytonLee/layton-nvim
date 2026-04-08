return {
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
		config = function()
			vim.g.mkdp_markdown_css = vim.fn.stdpath("config") .. "/mkdp/markdown.css"
		end,
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		-- dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
		-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
		opts = {
			only_render_image_at_cursor = "enable",
		},
	},
	{
		"3rd/diagram.nvim",
		dependencies = {
			{
				"3rd/image.nvim",
				config = function()
					require("image").setup({
						backend = "kitty", -- or "ueberzug" or "sixel"
						processor = "magick_cli", -- or "magick_rock"
						integrations = {
							markdown = {
								enabled = true,
								clear_in_insert_mode = true,
								download_remote_images = true,
								only_render_image_at_cursor = true,
								only_render_image_at_cursor_mode = "popup", -- or "inline"
								floating_windows = false, -- if true, images will be rendered in floating markdown windows
								filetypes = { "markdown", "vimwiki" }, -- markdown extensions (ie. quarto) can go here
							},
						},
					})
				end,
			},
		},
		opts = {
			events = {
				render_buffer = {},
				clear_buffer = { "BufLeave" },
			},
		},
		config = function(_, opts)
			-- diagram.nvim only support [Kitty](https://github.com/kovidgoyal/kitty) or [Überzug++](https://github.com/jstkdng/ueberzugpp)
			local supported = vim.env.KITTY_WINDOW_ID
			if not supported then
				return
			end

			local rendering_enabled = false

			local diagram = require("diagram")
			diagram.setup(opts)

			-- toggle render
			local function toggle_diagram()
				rendering_enabled = not rendering_enabled

				if rendering_enabled then
					print("Diagram rendering: ENABLED")
					diagram.render()
				else
					print("Diagram rendering: DISABLED")
					diagram.clear()
				end
			end

			vim.keymap.set("n", "<leader>td", toggle_diagram, { desc = "Toggle Diagram Rendering" })
		end,
	},
}
