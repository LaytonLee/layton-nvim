local function search_markdown_frontmatter()
	local pickers = require("telescope.pickers")
	local finders = require("telescope.finders")
	local make_entry = require("telescope.make_entry")
	local conf = require("telescope.config").values

	local live_frontmatter = finders.new_job(function(prompt)
		if not prompt or prompt == "" then
			return nil
		end

		-- Parse input, e.g., "tags: movie"
		local key, value = prompt:match("([^:]+):%s*(.*)")
		local search_pattern

		if key and value then
			-- ^ matches start of line, .* matches anything in between
			search_pattern = "^" .. vim.trim(key) .. ":.*" .. vim.trim(value)
		else
			search_pattern = "^" .. prompt
		end

		-- use 'sh -c' to pipe ripgrep output into awk for strict line filtering
		-- --ignore-case makes the search case-insensitive
		-- awk -F: '$2 <= 10' checks if the line number (column 2) is 10 or less
		local command = string.format(
			"rg --line-number --column --no-heading --color=never --ignore-case --type md -e %q | awk -F: '$2 <= 10'",
			search_pattern
		)

		return { "sh", "-c", command }
	end, make_entry.gen_from_vimgrep({}), nil)

	pickers
	    .new({}, {
		    prompt_title = "Markdown Frontmatter Search (Lines 1-10, Case-Insensitive)",
		    finder = live_frontmatter,
		    previewer = conf.grep_previewer({}),
		    sorter = conf.generic_sorter({}),
	    })
	    :find()
end

return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
			vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

			vim.keymap.set("n", "<leader>fm", search_markdown_frontmatter, { desc = "Telescope Frontmatter" })
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({
							-- even more opts
						}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
