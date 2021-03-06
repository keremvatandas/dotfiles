local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables
local scopes = {o = vim.o, b = vim.bo, w = vim.wo}

local function opt(scope, key, value)
  scopes[scope][key] = value
  if scope ~= 'o' then scopes['o'][key] = value end
end


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
opt('o', 'mouse', 'a')                                -- Mouse Active
opt('o', 'wildmode', 'list:longest')                  -- Command-line completion mode
opt('w', 'list', true)                                -- Show some invisible characters (tabs...)
opt('w', 'number', true)                              -- Print line number
opt('w', 'relativenumber', true)                      -- Relative line numbers
opt('w', 'wrap', false)                               -- Disable line wrap




cmd "set list"
cmd [[set listchars=trail:·,precedes:«,extends:»,space:·,eol:↲,tab:▸\]]
cmd "set clipboard=unnamedplus"
cmd "set autochdir"
cmd "set ruler"
cmd "set cursorline"
cmd "let g:indentLine_enabled = 1"

cmd [[let &colorcolumn="80,".join(range(120,999),",")]]
cmd "highlight ColorColumn ctermbg=0 guibg=#2c2d27"

cmd "syntax on"
cmd "colorscheme tokyonight"
cmd "hi Comment guifg=#88C4B2"

cmd "set iskeyword+=-"                  -- treat dash separated words as a word text object"
cmd "set shortmess+=c"                  -- Don't pass messages to |ins-completion-menu|.
cmd "set inccommand=split"              -- Make substitution work in realtime

-- blankline
-- g.indentLine_char_list = [[┆]]
