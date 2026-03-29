return {
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
							clear_in_insert_mode = false,
							download_remote_images = true,
							only_render_image_at_cursor = true,
							only_render_image_at_cursor_mode = "popup", -- or "inline"
							floating_windows = false, -- if true, images will be rendered in floating markdown windows
							filetypes = { "markdown", "vimwiki" }, -- markdown extensions (ie. quarto) can go here
						},
					},
				})
			end,
		}, -- you'd probably want to configure image.nvim manually instead of doing this
	},
	opts = { -- you can just pass {}, defaults below
		events = {
			render_buffer = {}, -- "InsertLeave", "BufWinEnter", "TextChanged"
			clear_buffer = { "BufLeave" },
		},
		renderer_options = {
			mermaid = {
				background = nil, -- nil | "transparent" | "white" | "#hex"
				theme = nil, -- nil | "default" | "dark" | "forest" | "neutral"
				scale = 1, -- nil | 1 (default) | 2  | 3 | ...
				width = nil, -- nil | 800 | 400 | ...
				height = nil, -- nil | 600 | 300 | ...
				cli_args = nil, -- nil | { "--no-sandbox" } | { "-p", "/path/to/puppeteer" } | ...
			},
			plantuml = {
				charset = nil,
				cli_args = nil, -- nil | { "-Djava.awt.headless=true" } | ...
			},
			d2 = {
				theme_id = nil,
				dark_theme_id = nil,
				scale = nil,
				layout = nil,
				sketch = nil,
				cli_args = nil, -- nil | { "--pad", "0" } | ...
			},
			gnuplot = {
				size = nil, -- nil | "800,600" | ...
				font = nil, -- nil | "Arial,12" | ...
				theme = nil, -- nil | "light" | "dark" | custom theme string
				cli_args = nil, -- nil | { "-p" } | { "-c", "config.plt" } | ...
			},
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
}
