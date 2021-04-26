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


local map = vim.api.nvim_set_keymap

map("n", "<leader>ll", ":set list!<CR>", {noremap=true, silent=true})

map("n", "<leader>/", ":vsplit<CR>", {noremap=true, silent=true})
map("v", "<leader>/", ":vsplit<CR>", {noremap=true, silent=true})

map("n", "<leader>-", ":split<CR>", {noremap=true, silent=true})
map("v", "<leader>-", ":split<CR>", {noremap=true, silent=true})

map("n", "<leader>fs", ":w<CR>", {noremap=true, silent=true})
map("n", "<leader>qq", ":q!<CR>", {noremap=true, silent=true})

map("n", "<leader><Up>", ":wincmd k<CR>", {noremap=true, silent=true})
map("n", "<leader><Down>", ":wincmd j<CR>", {noremap=true, silent=true})
map("n", "<leader><Left>", ":wincmd h<CR>", {noremap=true, silent=true})
map("n", "<leader><Right>", ":wincmd l<CR>", {noremap=true, silent=true})


--- APPS KeyBindings
map("n", "<leader>t", ":TagbarToggle<CR>", {noremap=true, silent=true})
map("v", "<leader>t", ":TagbarToggle<CR>", {noremap=true, silent=true})

map("n", "<leader>ut", ":UndotreeToggle<CR>", {noremap=true, silent=true})
map("v", "<leader>ut", ":UndotreeToggle<CR>", {noremap=true, silent=true})

map("n", "<C-c>/", ":CommentToggle<CR>", {noremap=true, silent=true})
map("v", "<C-c>/", ":CommentToggle<CR>", {noremap=true, silent=true})

map("n", "<leader>pp", ":PyrightOrganizeImports<CR>", {noremap=true, silent=true})


map("n", "<leader>wp", ":ToggleWhitespace<CR>", {noremap=true, silent=true})
map("n", "<leader><BS>", ":StripWhitespace<CR>", {noremap=true, silent=true})
map("n", "<leader>l", ":IndentLinesToggle<CR>", {noremap=true, silent=true})

map("n", "<leader>d", ":Dashboard<CR>", {noremap=true, silent=true})

map("n", "<leader>md", ":MarkdownPreviewToggle<CR>", {noremap=true, silent=true})
