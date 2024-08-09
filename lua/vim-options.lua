-- display both absolute and relative line number
vim.o.statuscolumn = "%s %l %r"
vim.cmd("set number")
vim.cmd("set rnu")

vim.cmd("set cursorline")
vim.cmd("set noexpandtab")
vim.cmd("set tabstop=8")
vim.cmd("set shiftwidth=8")
vim.cmd("set ignorecase smartcase")
vim.cmd("set wildmenu")
vim.cmd("set wildmode=longest:full,full")

local opts = { noremap = true, silent = true }

-- map space as leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keymap.set("", "<Space>", "<Nop>", opts)

-- map ; as : for quick command enter
vim.keymap.set("", ";", ":", opts)

-- normal --
vim.keymap.set('n', '<leader>q', ':q<CR>', opts)
-- better window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)

-- move up and down faster
vim.keymap.set("n", "J", ":+10<CR>", opts)
vim.keymap.set("n", "K", ":-10<CR>", opts)

-- move text up and down
vim.keymap.set("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)
vim.keymap.set("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)

-- insert --
-- press jk fast to exit insert mode 
vim.keymap.set("i", "jk", "<ESC>", opts)

-- visual --
-- move text up and down
vim.keymap.set("v", "<A-k>", "<Esc>:m .-2<CR>==", opts)
vim.keymap.set("v", "<A-j>", "<Esc>:m .+1<CR>==", opts)

-- visual block --
-- move text up and down
vim.keymap.set("x", "J", ":move '>+1<CR>gv-gv", opts)
vim.keymap.set("x", "K", ":move '<-2<CR>gv-gv", opts)
vim.keymap.set("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
vim.keymap.set("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)
