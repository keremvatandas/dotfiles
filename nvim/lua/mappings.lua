-----------------------------------------------------------
-- Keymaps configuration file: keymaps of neovim
-- and plugins.
-- key (mode, keymap, mapped-to, options)
-----------------------------------------------------------

local key = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }
local cmd = vim.cmd
local g = vim.g

-----------------------------------------------------------
-- Neovim shortcuts:
-----------------------------------------------------------

-- Map Esc to kk
-- key('i', 'kk', '<Esc>', default_opts)

-- Fast saving with Ctrl + s
key('n', '<leader>w', ':write<CR>', default_opts)
key('i', '<C-s>', '<Esc><Cmd>w<CR>i', default_opts)

-- Move around splits using Ctrl + {h,l,j,k}
key('n', '<C-h>', '<C-w>h', default_opts)
key('n', '<C-l>', '<C-w>l', default_opts)
key('n', '<C-j>', '<C-w>j', default_opts)
key('n', '<C-k>', '<C-w>k', default_opts)

-- Close all windows and exit from neovim
key('n', '<C-q>', '<Cmd>qa!<CR>', default_opts)
key('i', '<C-q>', '<Esc><Cmd>qa!<CR>', default_opts)

-- Clear search highlighting
key('n', '<leader><Esc>', '<Cmd>nohl<CR>', default_opts)

-- Open terminal
key('n', '<C-t>', '<Cmd>te<CR>', default_opts)


-- Split Window
key("n", "<leader>/", ":vsplit<CR>", default_opts)
key("v", "<leader>/", ":vsplit<CR>", default_opts)

key("n", "<leader>-", ":split<CR>", default_opts)
key("v", "<leader>-", ":split<CR>", default_opts)

-- Close/Quit
key("n", "<leader>q", ":q!<CR>", default_opts)

-- Window Select
key("n", "<leader><Up>", ":wincmd k<CR>", default_opts)
key("n", "<leader><Down>", ":wincmd j<CR>", default_opts)
key("n", "<leader><Left>", ":wincmd h<CR>", default_opts)
key("n", "<leader><Right>", ":wincmd l<CR>", default_opts)


-- Tagbar
key("n", "<leader>t", ":TagbarToggle<CR>", default_opts)
key("v", "<leader>t", ":TagbarToggle<CR>", default_opts)

key("n", "<leader>ut", ":UndotreeToggle<CR>", default_opts)
key("v", "<leader>ut", ":UndotreeToggle<CR>", default_opts)

key("n", "<leader>pp", ":PyrightOrganizeImports<CR>", default_opts)

-- map("n", "<leader>wp", ":ToggleWhitespace<CR>", opt)
-- map("n", "<leader><BS>", ":StripWhitespace<CR>", opt)

key("n", "<leader>l", ":set list!<CR>", default_opts)

-----------------------------------------------------------
-- Applications & Plugins shortcuts:
-----------------------------------------------------------

-- Bufferline
key('n', '<TAB>', '<Cmd>BufferLineCycleNext<CR>', default_opts)
key('n', '<S-TAB>', '<Cmd>BufferLineCyclePrev<CR>', default_opts)

-- Nvim-tree
key('n', '<C-n>', '<Cmd>NvimTreeToggle<CR>', default_opts)       -- open/close
key('n', '<C-r>', '<Cmd>NvimTreeRefresh<CR>', default_opts)  -- refresh

-- Telescope
key("n", "<leader>fg", "<Cmd>Telescope live_grep<CR>", default_opts)
key("n", "<leader>ff", "<Cmd>Telescope find_files<CR>", default_opts)
key("n", "<leader>fb", "<Cmd>Telescope buffers<CR>", default_opts)
key("n", "<leader>cs", "<Cmd>Telescope colorscheme<CR>", default_opts)

key("n", "<leader>gs", "<Cmd>Telescope git_status<CR>", default_opts)
key("n", "<leader>gc", "<Cmd>Telescope git_commits<CR>", default_opts)
key("n", "<leader>gt", "<Cmd>Telescope git_bcommits<CR>", default_opts)
key("n", "<leader>gb", "<Cmd>Telescope git_branches<CR>", default_opts)


-- Kommentary
g.kommentary_create_default_mappings = false
key("n", "<leader>k", "<Plug>kommentary_line_default", {})
key("x", "<leader>k", "<Plug>kommentary_visual_default<C-c>", {})

-- Lsp native commands
key('n', '<leader>a', '<cmd>lua vim.lsp.buf.code_action()<CR>', default_opts)
key('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', default_opts)

key('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', default_opts)
key('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', default_opts)

key('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', default_opts)
key('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', default_opts)
key('n', 'ge', '<cmd>lua vim.diagnostic.setloclist()<CR>', default_opts)

-- Code formatter.
key("n", "<C-f>", "<Cmd>Neoformat<CR>", default_opts)

