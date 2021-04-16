-- load all plugins
require "pluginsList.lua"
require "file-icons.lua"
require "bufferline.lua"
require "statusline.lua"

require("colorizer").setup()
require("neoscroll").setup() -- smooth scroll

-- lsp
require "lspconfig.lua"
require "compe.lua"

local cmd = vim.cmd
local g = vim.g
local o = vim.o
local w = vim.w
local b = vim.b

g.mapleader = " "
g.auto_save = 1

o.hidden = true
o.ignorecase = true
o.splitbelow = true
o.splitright = true
o.termguicolors = true
o.numberwidth = 2
o.mouse = "a"
o.cmdheight = 1
o.updatetime = 250
o.clipboard = "unnamedplus"

w.number = true
w.signcolumn = "yes"

b.shiftwidth = 2


-- colorscheme related stuff
cmd "syntax enable"
cmd "syntax on"

local base16 = require "base16"
base16(base16.themes["onedark"], true)

-- blankline
local indent = 2

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
