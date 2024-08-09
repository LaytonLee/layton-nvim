return {
	"iamcco/markdown-preview.nvim",
	config = function()
		vim.fn["mkdp#util#install"]()

		local mkdp_preview_option = {
			mkit = {},
			katex = {},
			uml = {},
			maid = {},
			disable_sync_scroll = 0,
			sync_scroll_type = "middle",
			hide_yaml_meta = 1,
			sequence_diagrams = {},
			flowchart_diagrams = {},
			-- content_editable = 
			content_editable = 0,
			toc = {}
		}
	end,
}
