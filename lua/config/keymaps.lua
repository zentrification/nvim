-- Syntax
-- vim.keymap.set("mode", "keys", "mapping", opts)

-- Modes
-- "n" = normal_mode
-- "i" = insert_mode
-- "v" = visual_mode
-- "x" = visual_block_mode
-- "t" = term_mode
-- "c" = command_mode

-- Show all mappings with
-- :map, :nmap, :vmap, :imap

local opts = { noremap = true, silent = true }
local telescope = require('telescope.builtin')

-- Defaults improvements
--
-- keep cursor in same place
vim.keymap.set("n", "J", "mzJ`z", opts)
-- center navigation
vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)
-- center searches
vim.keymap.set("n", "n", "nzzzv", opts)
vim.keymap.set("n", "N", "Nzzzv", opts)

-- Find & Replace
-- does not show command bar until you type something after "s"
-- need keybindings to show current remaps
vim.keymap.set("n", "<Leader>s", ":%s/", opts)
vim.keymap.set("v", "<Leader>s", ":s/", opts)

-- Indentation
vim.keymap.set("v", "<Tab>",   ">gv", opts)
vim.keymap.set("v", "<S-Tab>", "<gv", opts)

-- Write & exit
vim.keymap.set("n", "<Leader>w", ":w<CR>", opts)
vim.keymap.set("n", "<Leader>x", ":x<CR>", opts)

-- Splits
vim.keymap.set("n", "ss", "<C-w>s", opts)
vim.keymap.set("n", "vv", "<C-w>v", opts)

-- Split navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)

-- Split resizing
vim.keymap.set("n", "<C-Up>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Tab navigation
vim.keymap.set("n", "<Left>",  ":tabprevious<CR>", opts)
vim.keymap.set("i", "<Left>",  "<Esc>:tabprevious<CR>", opts)
vim.keymap.set("n", "<Right>", ":tabnext<CR>", opts)
vim.keymap.set("i", "<Right>", "<Esc>:tabnext<CR>", opts)
vim.keymap.set("n", "<Up>",    ":execute 'silent! tabmove ' . (tabpagenr()-2)<CR>", opts)
vim.keymap.set("n", "<Down>",  ":execute 'silent! tabmove ' . tabpagenr()<CR>", opts)

-- Visual move
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts)
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Nerdtree
vim.keymap.set("n", "\\n",  ":NERDTreeToggle<CR>", opts)
vim.keymap.set("n", "\\nf", ":NERDTreeFind<CR>", opts)

-- Telescope
vim.keymap.set("n", "<C-p>",  telescope.find_files, opts)
vim.keymap.set("n", "<Leader>b", telescope.buffers, opts)
vim.keymap.set("n", "<Leader>g", telescope.live_grep, opts)
vim.keymap.set("n", "<Leader>h", telescope.help_tags, opts)


-- ThePimeagean's remaps
-- https://github.com/ThePrimeagen/init.lua/blob/master/lua/theprimeagen/remap.lua
