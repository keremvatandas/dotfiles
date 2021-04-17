local map = vim.api.nvim_set_keymap

map("n", "<leader>t", ":TagbarToggle<CR>", {noremap=true, silent=true})
map("v", "<leader>t", ":TagbarToggle<CR>", {noremap=true, silent=true})

map("n", "<leader>ut", ":UndotreeToggle<CR>", {noremap=true, silent=true})
map("v", "<leader>ut", ":UndotreeToggle<CR>", {noremap=true, silent=true})


map("n", "<leader>/", ":vsplit<CR>", {noremap=true, silent=true})
map("v", "<leader>/", ":vsplit<CR>", {noremap=true, silent=true})

map("n", "<leader>-", ":split<CR>", {noremap=true, silent=true})
map("v", "<leader>-", ":split<CR>", {noremap=true, silent=true})

map("n", "<C-c>/", ":CommentToggle<CR>", {noremap=true, silent=true})
map("v", "<C-c>/", ":CommentToggle<CR>", {noremap=true, silent=true})

map("n", "<leader>fs", ":w<CR>", {noremap=true, silent=true})
map("n", "<leader>qq", ":q!<CR>", {noremap=true, silent=true})

map("n", "<leader><Up>", ":wincmd k<CR>", {noremap=true, silent=true})
map("n", "<leader><Down>", ":wincmd j<CR>", {noremap=true, silent=true})
map("n", "<leader><Left>", ":wincmd h<CR>", {noremap=true, silent=true})
map("n", "<leader><Right>", ":wincmd l<CR>", {noremap=true, silent=true})
