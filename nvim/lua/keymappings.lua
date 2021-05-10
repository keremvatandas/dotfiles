--[[

The main question - end of line

$ goes to the end of line, remains in command mode
A goes to the end of line, switches to insert mode

Conversely - start of line (technically the first non-whitespace character)
^ goes to the start of line, remains in command mode
I (uppercase i) goes to the start of line, switches to insert mode

Further - start of line (technically the first column irrespective of whitespace)
0 (zero) goes to the start of line, remains in command mode
0i (zero followed by lowercase i) goes the start of line, switches to insert mode

]]--

vim.g.mapleader = " "
local map = vim.api.nvim_set_keymap
local opt = {noremap = true, silent = true}

map("n", "<leader>/", ":vsplit<CR>", opt)
map("v", "<leader>/", ":vsplit<CR>", opt)

map("n", "<leader>-", ":split<CR>", opt)
map("v", "<leader>-", ":split<CR>", opt)

map("n", "<leader>fs", ":w<CR>", opt)
map("n", "<leader>qq", ":q!<CR>", opt)

map("n", "<leader><Up>", ":wincmd k<CR>", opt)
map("n", "<leader><Down>", ":wincmd j<CR>", opt)
map("n", "<leader><Left>", ":wincmd h<CR>", opt)
map("n", "<leader><Right>", ":wincmd l<CR>", opt)


--- APPS KeyBindings
map("n", "<leader>t", ":TagbarToggle<CR>", opt)
map("v", "<leader>t", ":TagbarToggle<CR>", opt)

map("n", "<leader>ut", ":UndotreeToggle<CR>", opt)
map("v", "<leader>ut", ":UndotreeToggle<CR>", opt)

map("n", "<C-c>/", ":CommentToggle<CR>", opt)
map("v", "<C-c>/", ":CommentToggle<CR>", opt)

map("n", "<leader>pp", ":PyrightOrganizeImports<CR>", opt)

map("n", "<leader>wp", ":ToggleWhitespace<CR>", opt)
map("n", "<leader><BS>", ":StripWhitespace<CR>", opt)

map("n", "<leader>l", ":IndentLinesToggle<CR>", opt)
map("n", "<leader>ll", ":set list!<CR>", opt)

map("n", "<leader>md", ":Glow<CR>", opt)



-- Telescope mappings
map("n", "<Leader>ff", [[<Cmd>lua require('telescope.builtin').find_files()<CR>]], opt)
map("n", "<Leader>fb", [[<Cmd>lua require('telescope.builtin').buffers()<CR>]], opt)
map("n", "<Leader>fh", [[<Cmd>lua require('telescope.builtin').help_tags()<CR>]], opt)
map("n", "<Leader>fo", [[<Cmd>lua require('telescope.builtin').oldfiles()<CR>]], opt)
map("n", "<Leader>fl", [[<Cmd>lua require('telescope.builtin').live_grep({prompt_prefix=🔍 })<CR>]], opt)

-- Searches for a string under the cursor in current directory.
map("n", "<Leader>fg", [[<Cmd>lua require('telescope.builtin').grep_string()<CR>]], opt)

-- Show All KeyMap
map("n", "<Leader>km", [[<Cmd>lua require('telescope.builtin').keymaps()<CR>]], opt)

-- Git Status
map("n", "<Leader>gs", [[<Cmd>lua require('telescope.builtin').git_status()<CR>]], opt)
-- Git Branch
map("n", "<Leader>gb", [[<Cmd>lua require('telescope.builtin').git_branches()<CR>]], opt)
