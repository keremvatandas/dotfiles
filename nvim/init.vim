scriptencoding utf-8
set encoding=utf-8
set termencoding=utf-8

" ============================================================================
"                                My Functions
" ============================================================================

" Auto Vim-Plug
if empty(glob('~/.conifg/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  " autocmd VimEnter * PlugInstall --sync | source ~/.config/nvim/init.vim
endif



call plug#begin('~/.config/nvim/plugged')


" ============================================================================
"                                Display / Navigating
" ============================================================================
Plug 'mhinz/vim-startify'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }

Plug 'majutsushi/tagbar', {'on': 'TagbarToggle'}

Plug 'scrooloose/nerdtree', { 'on':  ['NERDTreeToggle', 'NERDTreeFind'] }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'kien/ctrlp.vim'  " CTRL-P / Fuzzy Finder

Plug 'tpope/vim-vinegar', {'on': '<Plug>VinegarVerticalSplitUp'} " SplitWindows

Plug 'christoomey/vim-tmux-navigator'

Plug 'airblade/vim-gitgutter'

Plug 'tpope/vim-sensible'  " autoread|backspace|incsearch|scrolloff etc..

Plug 'sjl/vitality.vim'  " Make vim play nicely with Iterm2 and tmux for MacOS

Plug 'tpope/vim-fugitive'  " fugitive.vim: A Git wrapper so awesome

Plug 'mhinz/vim-signify'  " Show a diff using Vim its sign column.
Plug 'pelodelfuego/vim-swoop'

" TELESCOP Display
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
" ============================================================================
"                                Editing
" ============================================================================
Plug 'tpope/vim-commentary'  " visual mode -> gc

Plug 'tpope/vim-repeat'  " enables repeating other supported plugins with the . command

" mappings to easily delete, change and add such surroundings in pairs, such as quotes, parens, etc.
Plug 'tpope/vim-surround'

" For Undotree, use <leader>ut
Plug 'mbbill/undotree'

Plug 'farmergreg/vim-lastplace'
Plug 'szw/vim-smartclose', {'on': 'SmartClose'}
Plug 'mhinz/vim-grepper', { 'on': ['Grepper', '<plug>(GrepperOperator)'] }
Plug 'tmhedberg/SimpylFold'  " Folding

" substitute, search, and abbreviate multiple variants of a word
Plug 'tpope/vim-abolish'

" search inside files using ripgrep. This plugin provides an Ack command.
Plug 'wincent/ferret'



" ============================================================================
"                       Programming Lang / Tools
" ============================================================================
Plug 'fatih/vim-go'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

call plug#end()





" ============================================================================
"                             MAPPING
" ============================================================================
" Recursive Non-recursive Unmap Modes
"   :map        :noremap  :unmap  normal, visual, operator-pending
"   :nmap     :nnoremap :nunmap normal
"   :xmap     :xnoremap :xunmap visual
"   :cmap     :cnoremap :cunmap command-line
"   :omap     :onoremap :ounmap operator-pending
"   :imap     :inoremap :iunmap insert

" Abbreviations
abbr funciton function
abbr teh the
abbr tempalte template
abbr fitler filter
abbr cosnt const
abbr attribtue attribute
abbr attribuet attribute

" Allow backspacing over indention, line breaks and insertion start.
set backspace=indent,eol,start  " (default "indent,eol,start")

set nocompatible  " be iMproved, required - Vim Only

" Helps force plug-ins to load correctly when it is turned back on below.
filetype off      " required, it'll change for plugin

set showtabline=2

set omnifunc=htmlcomplete#CompleteTags
set completeopt=menuone,noinsert,noselect
set shortmess+=cI

" Set bigger history of executed commands.
set history=100

set showcmd  " Show (partial) command in status line.
set showmatch  " Show matching brackets.
set matchtime=3

" Show current mode at the bottom.
set showmode

" Automatically re-read files if unmodified inside Vim.
set autowrite

" check one time after 4s of inactivity in normal mode
set autoread
au CursorHold * checktime

" Manage multiple buffers effectively:
" the current buffer can be “sent” to the background without writing to disk.
" When a background buffer becomes current again, marks and undo-history are remembered.
" See chapter Buffers to understand this better.
set hidden

set updatetime=300

"syntax enable
syntax on

" Font Family
" let g:Guifont="Hasklig:h12"

" colorschema
colorscheme challenger_deep
" colorscheme two-firewatch

" Always show cursor position.
set ruler

" Display command line’s tab complete options as a menu.
set wildmenu
set wildmode=longest:full,full
set wildignorecase
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc     " MacOSX/Linux

" Highlight the line currently under cursor.
set cursorline
" hi CursorColumn ctermbg=046
" https://upload.wikimedia.org/wikipedia/commons/1/15/Xterm_256color_chart.svg
" hi cursorline cterm=underline ctermbg=000000 ctermfg=87ff87
" Show line numbers on the sidebar.
set number

" Show line number on the current line and relative numbers on all other lines. Works only if the option above (number) is enabled.
set relativenumber

" Don't let Vim hide characters or make loud dings
set conceallevel=1

" Disable beep on errors.
set noerrorbells

" Enable mouse for scrolling and resizing.
set mouse=a


" Set the window’s title, reflecting the file currently being edited.
set title "Coding Session :)"

" Swap and backup file options - disable all of them:
set noswapfile
" set nobackup
set nowb

" Backuo Dir
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" Better display for messages
set cmdheight=2

" Indentation options:
set autoindent              " New lines inherit the indentation of previous lines.
filetype plugin indent on   " Smart auto indentation (instead of old smartindent option).
set tabstop=4               " Show existing tab with 4 spaces width.
set shiftwidth=4            " When indenting with ‘>’, use 2 spaces width.
set expandtab               " On pressing tab, insert 4 spaces.
set nowrap                  " Don’t wrap lines.
set softtabstop=4
set textwidth=120
set colorcolumn=120
" highlight ColorColumn ctermbg=lightgrey guibg=LightYellow

" Search options:
set gdefault    " apply substitutions globally by default. add `g` for old behavior
set incsearch   " Find the next match as we type the search.
set hlsearch    " Highlight searches by default.
set ignorecase  " Ignore case when searching . . .
set smartcase   " unless you type a capital.
set nolazyredraw " don't redraw while executing macros
nnoremap <leader><BS> :noh<CR>

set magic " Set magic on, for regex

" Miscellaneous Options
set confirm             " Display a confirmation dialog when closing an unsaved file.
" set nomodeline          " Ignore file’s mode lines; use vimrc configurations instead.
set nrformats-=octal    " Interpret octal as decimal when incrementing numbers.
set shell=/bin/zsh      " The shell used to execute commands.
" set spell               " Enable spellchecking.

" Folding -> :h syn-file-remarks
set foldmethod=indent " Defines the type of folding.
set foldlevel=99

set lazyredraw

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

set showbreak=↪\
set listchars=tab:\│\ ,eol:↵,nbsp:␣,trail:⋅,extends:⟩,precedes:⟨,space:⋅
" set list


set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case

" COPY/PASTE FOR MacOS
if has('nvim')
  set inccommand=nosplit
  set clipboard+=unnamedplus
  " temporary solution to workaround slow startup
  if has('mac')
    let g:clipboard = {
              \   'name': 'mac-custom',
              \   'copy': {
              \      '+': 'pbcopy',
              \      '*': 'pbcopy',
              \    },
              \   'paste': {
              \      '+': 'pbpaste',
              \      '*': 'pbpaste',
              \   },
              \ }
  endif
  augroup terminal_au
    autocmd!

    autocmd TermOpen * setlocal nonumber norelativenumber
  augroup END<Paste>

let g:loaded_python_provider=0
" let g:python_host_prog = '/usr/local/bin/python3'
let g:python3_host_prog = '~/.virtualenvs/neovim/bin/python3'
  " let g:python_host_prog = $HOME . '/.virtualenvs/neovim2/bin/python'
  " let g:python3_host_prog = $HOME . '/.virtualenvs/neovim3/bin/python'
else
  set ttyfast
  set clipboard+=unnamed
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

" Hard to type things {{{
    iabbrev >> →
    iabbrev << ←
    iabbrev ^^ ↑
    iabbrev VV ↓
    iabbrev aa λ
" }}}


" ============================================================================
"                            Leader Key
" ============================================================================
" Using the Leader Key
nnoremap <Space> <nop>
let g:mapleader = "\<Space>"
let g:maplocalleader = '\'

nnoremap j gj
nnoremap k gk

nnoremap <leader>h :set list!<CR>



" ============================================================================
"                            Git Gutter
" ============================================================================
" if you don't want vim-gitgutter to set up any mappings at all, use this:
set signcolumn=yes

let g:gitgutter_sign_added = '✚'
let g:gitgutter_sign_modified = '✹'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '-'
let g:gitgutter_sign_modified_removed = '-'

let g:gitgutter_map_keys = 0
let g:gitgutter_enabled = 0  " Turn-off Gitgutter default
nnoremap <silent><leader>gt :GitGutterToggle<cr>



" ============================================================================
"                            Undo Tree Toggle
" ============================================================================
" Persistent Undo -> mkdir ~/.vim/undodir  [:help undo]
set undofile   " Maintain undo history between sessions
set undodir=~/.nvimtmp
nnoremap <silent><leader>ut :UndotreeToggle<cr>




" ============================================================================
"                            Startify
" ============================================================================
nnoremap <leader>st :Startify<CR>

" returns all modified files of the current git repo
" `2>/dev/null` makes the command fail quietly, so that when we are not
" in a git repo, the list will be empty
function! s:gitModified()
    let files = systemlist('git ls-files -m 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

" same as above, but show untracked files, honouring .gitignore
function! s:gitUntracked()
    let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

" Read ~/.NERDTreeBookmarks file and takes its second column
function! s:nerdtreeBookmarks()
    let bookmarks = systemlist("cut -d' ' -f 2- ~/.NERDTreeBookmarks")
    let bookmarks = bookmarks[0:-2] " Slices an empty last line
    return map(bookmarks, "{'line': v:val, 'path': v:val}")
endfunction

let g:startify_bookmarks = systemlist("cut -sd' ' -f 2- ~/.NERDTreeBookmarks")

let g:startify_lists = [
        \ { 'type': 'files',     'header': ['   MRU']            },
        \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
        \ { 'type': 'sessions',  'header': ['   Sessions']       },
        \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
        \ { 'type': function('s:gitModified'),  'header': ['   git modified']},
        \ { 'type': function('s:gitUntracked'), 'header': ['   git untracked']},
        \ { 'type': 'commands',  'header': ['   Commands']       },
        \ { 'type': function('s:nerdtreeBookmarks'), 'header': ['   NERDTree Bookmarks']}
        \ ]


" ============================================================================
"                            Indent Guides
" ============================================================================
let g:indentLine_enabled = 1
let g:indentLine_char = "⟩"
let g:indentLine_char = '┊'
let g:indentLine_color_term = 239
let g:indentLine_bgcolor_term = 202


" ============================================================================
"                           Airline
" ============================================================================
" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" let g:airline_theme='onehalfdark'
let g:airline_theme='ayu_mirage'

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail'

let g:airline#extensions#coc#enabled = 1
let airline#extensions#coc#error_symbol = 'E:'
let airline#extensions#coc#warning_symbol = 'W:'
let airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'
let airline#extensions#coc#stl_format_warn = '%W{[%w(#%fw)]}'


" ============================================================================
"                           VIM SYNTASTIC
" ============================================================================
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


" ============================================================================
"                            NERDTree
" ============================================================================
let NERDTreeShowHidden=1  " show hidden files by default

let NERDTreeIgnore=['\.pyc$', '\~$', '\.swp$']  " ignore specifc files

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

nnoremap <silent><leader>nt :NERDTreeToggle<cr>

" NERDTree Git Plugin
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

augroup nerdtree
    autocmd!
    autocmd FileType nerdtree setlocal nolist " turn off whitespace characters
    autocmd FileType nerdtree setlocal nocursorline " turn off line highlighting for performance
augroup END

" ============================================================================
"                            Surround
" ============================================================================
" Good Conf, Conf must not be timeoutlen 1
augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=100
    au InsertLeave * set timeoutlen=1000
augroup END

" ============================================================================
"                            Vitality
" ============================================================================
" auto save all files when focus is lost or when switching buffers
autocmd FocusLost,BufLeave * :wa

" ============================================================================
"                            Git Fugitive
" ============================================================================
nnoremap <space>ga :Git add %:p<CR><CR>
nnoremap <space>gs :Gstatus<CR>
nnoremap <space>gc :Gcommit -v -q<CR>
nnoremap <space>gt :Gcommit -v -q %:p<CR>
nnoremap <space>gd :Gdiff<CR>
nnoremap <space>ge :Gedit<CR>
nnoremap <space>gr :Gread<CR>
nnoremap <space>gw :Gwrite<CR><CR>
nnoremap <space>gl :silent! Glog<CR>:bot copen<CR>
nnoremap <space>gp :Ggrep<Space>
nnoremap <space>gm :Gmove<Space>
nnoremap <space>gb :Git branch<Space>
nnoremap <space>go :Git checkout<Space>
nnoremap <space>gps :Dispatch! git push<CR>
nnoremap <space>gpl :Dispatch! git pull<CR>

" ============================================================================
"                            CTRL P  /
" ============================================================================
" buffers
let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v[\/]\.(git|hg|svn)$|(certificate_storage|node_modules|bower|vendor|cache)$',
            \ 'file': '\v\.(exe|so|dll)$',
            \ 'link': 'some_bad_symbolic_links',
            \ }
let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux

let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_use_caching = 0  " 1 Enable
nnoremap <silent><leader>b :CtrlPBuffer<cr>




" ============================================================================
"                              Comment / Uncomment
" ============================================================================
map <silent><leader>] :call Comment()<CR>
map <silent><leader>[ :call Uncomment()<CR>

function! Comment()
  let ft = &filetype
  if ft == 'php' || ft == 'ruby' || ft == 'sh' || ft == 'make' || ft == 'python' || ft == 'perl' 
    silent s/^/\#/
  elseif ft == 'javascript' || ft == 'c' || ft == 'cpp' || ft == 'java' || ft == 'objc' || ft == 'scala' || ft == 'go'
    silent s:^:\/\/:g
  elseif ft == 'tex'
    silent s:^:%:g
  elseif ft == 'vim'
    silent s:^:\":g
  endif
endfunction

function! Uncomment()
  let ft = &filetype
  if ft == 'php' || ft == 'ruby' || ft == 'sh' || ft == 'make' || ft == 'python' || ft == 'perl'
    silent s/^\#//
  elseif ft == 'javascript' || ft == 'c' || ft == 'cpp' || ft == 'java' || ft == 'objc' || ft == 'scala' || ft == 'go'
    silent s:^\/\/::g
  elseif ft == 'tex'
    silent s:^%::g
  elseif ft == 'vim'
    silent s:^\"::g
  endif
endfunction



" ============================================================================
"                               FileTypes
" ============================================================================
" JavaScript
au FileType js set tabstop=2
au FileType js set shiftwidth=2

" Formaters
au FileType javascript setlocal formatprg=prettier
au FileType javascript.jsx setlocal formatprg=prettier
au FileType typescript setlocal formatprg=prettier\ --parser\ typescript
au FileType html setlocal formatprg=js-beautify\ --type\ html
au FileType scss setlocal formatprg=prettier\ --parser\ css
au FileType css setlocal formatprg=prettier\ --parser\ css

" ============================================================================
"                                FZF
" ============================================================================
let g:fzf_tags_command = 'ctags --extra=+f -R'
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }



" Trailing Whitespace {{{
" www.bestofvim.com/tip/trailing-whitespace/
function! TrimWhiteSpace()
  %s/\s\+$//e
endfunction

nnoremap <silent><leader>ww :call TrimWhiteSpace()<CR>

" autocmd FileWritePre   * :call TrimWhiteSpace()
" autocmc FileAppendPre  * :call TrimWhiteSpace()
" autocmd FilterWritePre * :call TrimWhiteSpace()
" autocmd BufWritePre    * :call TrimWhiteSpace()

" }}}

" NetRW {{{
let g:netrw_liststyle=3
let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_winsize=25
" augroup ProjectDrawer
"     autocmd!
"     autocmd VimEnter * :Vexplore
" augroup END
"
" }}}

function! s:check_back_space() abort
let col = col('.') - 1
return !col || getline('.')[col - 1]  =~# '\s'
endfunction


" ============================================================================
"                             COC.NVIM Setting
" ============================================================================
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use U to show documentation in preview window
nnoremap <silent> U :call <SID>show_documentation()<CR>

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>


" ============================================================================
"                             GO-LANG
" ============================================================================
" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0

" VIM-GO CONFIGS
" Syntax highlighting
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1
" Enable auto formatting on saving
let g:go_fmt_autosave = 1
" Run `goimports` on your current file on every save
let g:go_fmt_command = "goimports"
" Status line types/signatures
let g:go_auto_type_info = 1

" Go Add Tags
let g:go_addtags_transform = 'camelcase'
noremap gat :GoAddTags<cr>

" Run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)




" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fo <cmd>Telescope file_browser<cr>

" ============================================================================
"                             GLOBAL Keybinding
" ============================================================================


" Close Page
nnoremap <silent><leader>qq :SmartClose<cr>

" Window Split
nnoremap <silent><leader>/ :vsplit<cr>
nnoremap <silent><leader>- :split<cr>

" TagbarToggle
nnoremap <leader>tg <ESC>:TagbarToggle<cr>

" File Save
nnoremap <leader>fs <ESC>:w<cr>

nnoremap <silent><leader>p :CtrlP<CR>
nnoremap <silent><leader>bb :CtrlPBuffer<cr>

nmap <silent><leader><Up> :wincmd k<CR>
nmap <silent><leader><Down> :wincmd j<CR>
nmap <silent><leader><Left> :wincmd h<CR>
nmap <silent><leader><Right> :wincmd l<CR>
