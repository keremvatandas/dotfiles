-- load all plugins
require "pluginsList.lua"
require "file-icons.lua"
require "bufferline.lua"
require "statusline.lua"

require("colorizer").setup()
require("neoscroll").setup() -- smooth scroll

-- lsp
require("lspinstall").setup()
require "compe.lua"
require "lspconfig.lua"

local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables
local scopes = {o = vim.o, b = vim.bo, w = vim.wo}

local function opt(scope, key, value)
  scopes[scope][key] = value
  if scope ~= 'o' then scopes['o'][key] = value end
end


g.mapleader = " "
g.auto_save = 1

local indent = 4
opt('b', 'expandtab', true)                           -- Use spaces instead of tabs
opt('b', 'shiftwidth', indent)                        -- Size of an indent
opt('b', 'smartindent', true)                         -- Insert indents automatically
opt('b', 'tabstop', indent)                           -- Number of spaces tabs count for
opt('o', 'completeopt', 'menuone,noinsert,noselect')  -- Completion options (for deoplete)
opt('o', 'hidden', true)                              -- Enable modified buffers in background
opt('o', 'ignorecase', true)                          -- Ignore case
opt('o', 'joinspaces', false)                         -- No double spaces with join after a dot
opt('o', 'scrolloff', 4 )                             -- Lines of context
opt('o', 'shiftround', true)                          -- Round indent
opt('o', 'sidescrolloff', 8 )                         -- Columns of context
opt('o', 'smartcase', true)                           -- Don't ignore case with capitals
opt('o', 'splitbelow', true)                          -- Put new windows below current
opt('o', 'splitright', true)                          -- Put new windows right of current
opt('o', 'termguicolors', true)                       -- True color support
opt('o', 'ignorecase', true)                       -- True color support
opt('o', 'mouse', 'a')                       -- True color support
opt('o', 'wildmode', 'list:longest')                  -- Command-line completion mode
opt('w', 'list', true)                                -- Show some invisible characters (tabs...)
opt('w', 'number', true)                              -- Print line number
opt('w', 'relativenumber', true)                      -- Relative line numbers
opt('w', 'wrap', false)                               -- Disable line wrap

-- colorscheme related stuff
cmd "syntax enable"
cmd "syntax on"
cmd "colorscheme dracula"

-- blankline
g.indentLine_enabled = 1
g.indent_blankline_char = "┊"

cmd "hi IndentBlanklineChar guifg=#2a2e36"

g.indent_blankline_filetype_exclude = {"help", "terminal"}
g.indent_blankline_buftype_exclude = {"terminal"}

g.indent_blankline_show_trailing_blankline_indent = false
g.indent_blankline_show_first_indent_level = false

require('nvim_comment').setup()


require("treesitter.lua")
require("mappings.lua")
require("dashboard.lua")

-- highlights --
cmd "hi LineNr guifg=#42464e guibg=NONE"
cmd "hi Comment guifg=#42464e"

cmd "hi SignColumn guibg=NONE"
cmd "hi VertSplit guibg=NONE guifg=#2a2e36"
cmd "hi EndOfBuffer guifg=#1e222a"
cmd "hi PmenuSel guibg=#98c379"
cmd "hi Pmenu  guibg=#282c34"

cmd "hi Normal guibg=NONE ctermbg=NONE"

require "telescope.lua"
require "nvimTree.lua"

-- git signs
require "gitsigns.lua"

require("nvim-autopairs").setup()

-- symbols for autocomplete
require('lspkind').init({
    with_text = true,
    symbol_map = {
      Text = '  ',
      Method = '  ',
      Function = '  ',
      Constructor = '  ',
      Variable = '[]',
      Class = '  ',
      Interface = ' 蘒',
      Module = '  ',
      Property = '  ',
      Unit = ' 塞 ',
      Value = '  ',
      Enum = ' 練',
      Keyword = '  ',
      Snippet = '  ',
      Color = '',
      File = '',
      Folder = ' ﱮ ',
      EnumMember = '  ',
      Constant = '  ',
      Struct = '  '
    },
})



-- hide line numbers in terminal windows
vim.api.nvim_exec([[
   au BufEnter term://* setlocal nonumber
]], false)

-- inactive statuslines as thin splitlines
cmd("highlight! StatusLineNC gui=underline guibg=NONE guifg=#383c44")

cmd "hi clear CursorLine"
cmd "hi cursorlinenr guibg=NONE guifg=#abb2bf"

--  local mode_map = {
-- 	['n'] = 'normal ',
-- 	['no'] = 'n�operator pending ',
-- 	['v'] = 'visual ',
-- 	['V'] = 'v�line ',
-- 	[''] = 'v�block ',
-- 	['s'] = 'select ',
-- 	['S'] = 's�line ',
-- 	[''] = 's�block ',
-- 	['i'] = 'insert ',
-- 	['R'] = 'replace ',
-- 	['Rv'] = 'v�replace ',
-- 	['c'] = 'command ',
-- 	['cv'] = 'vim ex ',
-- 	['ce'] = 'ex ',
-- 	['r'] = 'prompt ',
-- 	['rm'] = 'more ',
-- 	['r?'] = 'confirm ',
-- 	['!'] = 'shell ',
-- 	['t'] = 'terminal '
-- }
--

-- Which Key (Hope to replace with Lua plugin someday)
-- vim.cmd('source ~/.config/nvim/vimscript/lv-whichkey/init.vim')
-- vim.cmd('source ~/.config/nvim/vimscript/functions.vim')

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
