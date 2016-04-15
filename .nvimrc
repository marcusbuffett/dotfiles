""" vim-plug
" PlugInstall to install plugins
" PlugClean to remove unused plugins
" PlugUpdate to update installed plugins
" UpdateRemotePlugins to update some neovim plugins
call plug#begin('~/.vim/plugged')

if has('nvim')
  " Autocomplete
  Plug 'Shougo/deoplete.nvim'
  " Syntax checking + linting + static code analysis
  Plug 'benekastah/neomake'
else
  " Autocomplete
  Plug 'Valloric/YouCompleteMe'
  " Syntax checking + linting + static code analysis
  Plug 'scrooloose/syntastic'
endif

" Fuzzy searching for everything
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Git wrapper
Plug 'lambdalisue/vim-gita'
" Commenting
Plug 'scrooloose/nerdcommenter'
" Status line
Plug 'bling/vim-airline'
" HTML and CSS abbreviation expansion using Emmet
Plug 'mattn/emmet-vim'
" Lots of color schemes
Plug 'flazz/vim-colorschemes'
" GHCMod for completion, linting, etc. of Haskell
Plug 'eagletmt/ghcmod-vim'
" Send ctrl-h, ctrl-j, ctrl-k, ctrl-l to tmux if there is no window
Plug 'christoomey/vim-tmux-navigator'
" Aligning of text using :Tabularize
Plug 'godlygeek/tabular'
" Lots of snippets
Plug 'honza/vim-snippets'
" Snippet engine
Plug 'SirVer/ultisnips'
" Adds operations like cs]) to change [test] to (test)
Plug 'tpope/vim-surround'
" Dash support (documentation app for OS X)
Plug 'rizzatti/dash.vim'
" Makes vim hard
Plug 'takac/vim-hardtime'
" Better JavaScript support (indentation, syntax highlighting, etc)
Plug 'pangloss/vim-javascript'
" Tern for some (minimal) static code analysis for JavaScript
Plug 'marijnh/tern_for_vim'
" Toggle location list / quickfix list
Plug 'Valloric/ListToggle'
" Substitute command that intelligently changes case, plurality,etc.
Plug 'tpope/vim-abolish'
" Highlight matching HTML tag
Plug 'gregsexton/MatchTag'
" File explorer
Plug 'scrooloose/nerdtree'
" Allows other plugins to support the repeat command (.)
Plug 'tpope/vim-repeat'
" CSS3 syntax support
Plug 'hail2u/vim-css3-syntax'
" Jade support
Plug 'digitaltoad/vim-jade'
" JSX support
Plug 'mxw/vim-jsx'
" SCSS support
Plug 'cakebaker/scss-syntax.vim'
" Indent guides, useful for callback-hell and HTML
Plug 'nathanaelkane/vim-indent-guides'
" Coffescript support
Plug 'kchmck/vim-coffee-script'
" Silver searcher wrapper
Plug 'rking/ag.vim'
" Set cwd to root of git project if exists
Plug 'airblade/vim-rooter'
" Needed by other plugins
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
" Dependency of other plugins
Plug 'xolox/vim-misc'
call plug#end()

""" Options

" Set leader to space
let mapleader="\<Space>"
" Enable syntax highlighting
syntax enable
" Copy indent from current line when inserting new line
set autoindent
" Smart indenting based on language
set smartindent
" Dark background
set background=dark
" Make backspace work as expected
set backspace=indent,eol,start
" Visual bell instead of audio bell
set visualbell
" Support hidden buffers
set hidden
" Highlight matches as the search is type
set incsearch
" Highlight all matches for a search
set hlsearch
" Don't wrap lines
set nowrap
" Number of spaces to use for auto indent + >> + <<, etc
set shiftwidth=2
" Number of spaces that a <Tab> inserts
set softtabstop=2
" Number of spaces that a <Tab> displays
set tabstop=2
" Expand tabs to spaces
set expandtab
" Ignore case when searching
set ignorecase
" Don't ignore case when there is a capital in the search
set smartcase
" Lots of undo
set undolevels=1000
" Allow vim to set the title of the shell
set title
" When hitting enter on a commented line, continue the comment
set formatoptions-=cr
" No scroll offset
set scrolloff=0
" Always have a status line
set laststatus=2
" Show line numbers
set number
" Don't store swap files
set noswapfile
" No limit to syntax highlighting
set synmaxcol=0
" use g flag for substitute by default
set gdefault
" Disable left scrollbar
set guioptions-=l
" Disable right scrollbar
set guioptions-=r
" Intercept mouse events
set mouse=a
" Timeout for mappings
set timeoutlen=500 
" Timeout for key sequences
set ttimeoutlen=10
" Use tags file relative to cwd, not current file's directory
set cpoptions+=d
" Lots of history
set history=5000
" Use new and shiny regex engine
set re=2
" Enable filetype detection
filetype on
" Enable filetype-specific indenting
filetype indent on
" Enable filetype-specific plugins
filetype plugin on

" Enable % to match more than braces
runtime macros/matchit.vim

" Set colorscheme
colorscheme solarized

" General mappings
nmap <leader>w :wa<CR>
nmap <leader>q :wq<CR>
nmap <leader>/ :noh<CR>
nmap <leader>x :pclose<CR>:ccl<CR>:helpclose<CR>
nmap <tab> :b#<CR>

" Augroup for editing
augroup EditVim
  au!
  au BufRead,BufNewFile *.jade setlocal ft=jade
  " au filetype haskell nmap <leader>t :w <bar> GhcModTypeInsert<CR>
  au filetype haskell nmap <leader>r :!runhaskell %<CR>
  au filetype haskell nmap <leader><leader>r :!cabal run<CR>
  au filetype haskell nmap <leader>h :!hoogle --count=5 ""<Left>
  au filetype javascript nmap <leader>r :!node %<CR>
  au filetype javascript nmap <leader>t :TernType<CR>
  au filetype javascript nmap <leader>f :TernDef<CR>
  au filetype javascript nmap K :TernDoc<CR>
  au filetype python setlocal ts=4 sts=4 sw=4
  au filetype python  nmap <leader>r :!python3 %<CR>
  au filetype ruby  nmap <leader>r :!ruby %<CR>
  au filetype php  nmap <leader>r :!php %<CR>
  au filetype cpp     nmap <leader>r :wa <bar> !~/.compileRun.py %<CR>
  au filetype cpp     nmap <leader>h :wa <bar> !~/.compile.py %<CR>
  au filetype haskell setlocal omnifunc=necoghc#omnifunc
  au FileType css     set omnifunc=csscomplete#CompleteCSS
  au FileType scss     set omnifunc=csscomplete#CompleteCSS
  au FileType javascript setlocal omnifunc=tern#Complete
  au FileType haskell nnoremap <buffer> <leader>t :GhcModType<CR>
  au FileType haskell nnoremap <buffer> <silent> <leader>ct :GhcModTypeClear<CR>
  au FileType haskell nnoremap <buffer> <silent> <leader>/ :noh <bar> GhcModTypeClear<CR>
augroup END

augroup VimCSS3Syntax
  autocmd!
  autocmd FileType css setlocal iskeyword+=-
  autocmd FileType scss setlocal iskeyword+=-
augroup END

""" Plugin configurations

"" FZF
" Search buffers
nmap <leader>n :Buffers<CR>
" Search tags
nmap <leader>b :Tags<CR>
" Search files
nmap <leader>p :Files<CR>
" Search lines in current file
nmap <leader>s :BLines<CR>

"" Dash
" Search dash for current word
nmap <leader>d :Dash<CR>
" Open command mode to search dash
nmap <leader>D :Dash 

"" Ag
" Search all files for text
nmap <leader>aa :Ag ""<left>
" Put cursor in field for file include regex
nmap <leader>ag :Ag -G "" ""<left><left><left><left>
" Only search specific file types
nmap <leader>agr :Ag -G "\.rb" ""<left>
nmap <leader>agj :Ag -G "\.js" ""<left>
nmap <leader>agh :Ag -G "\.hs" ""<left>
" TODO make a mapping to search for only matches that are in the same
" filetype as the current file

"" Gita
" Status without untracked files
noremap <Leader>gs :Gita status --untracked-files=no<CR>
" Status with untracked files
noremap <Leader>ga :Gita status<CR>
" Diff current file
noremap <Leader>gd :Gita diff<CR>
" Diff current file against cached file
noremap <Leader>gd :Gita diff --cached<CR>
" Blame current file
noremap <Leader>gb :Gita blame<CR>
" Stage the current file
noremap <Leader>gw :Gita add %<CR>
" Commit staged changes
noremap <Leader>gc :Gita commit<CR>

"" ListToggle
" Toggle location list 
let g:lt_location_list_toggle_map = '<leader>tl'
" Toggle quickfix list 
let g:lt_quickfix_list_toggle_map = '<leader>tq'

"" Hardtime
" Enable hardtime
let g:hardtime_default_on = 1
let g:hardtime_allow_different_key = 1
let g:list_of_normal_keys = ["h", "j", "k", "l", "-", "+", "<UP>", "<DOWN>", "<LEFT>", "<RIGHT>", "n", "w", "b", "W", "B", "e", "E", ";"]
let g:list_of_visual_keys = ["h", "j", "k", "l", "-", "+", "<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
" let g:list_of_insert_keys = ["<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]

"NerdTree
map <C-n> :NERDTreeToggle<CR>
map <C-f> :NERDTreeFocus<CR>
let NERDTreeMapHelp='<f1>'
" map <C-p> <c-w><c-p>


"NerdCommenter
let NERDSpaceDelims = 1

"CtrlP
" let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|bower_components\|dist'
" let g:ctrlp_working_path_mode = 'ra'
" let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" func! WordProcessorMode()
    " setlocal formatoptions=t1
    " setlocal textwidth=80
    " map j gj
    " map k gk
    " setlocal smartindent
    " setlocal spell spelllang=en_us
    " setlocal noexpandtab
" endfu
" com! WP call WordProcessorMode()

" match ErrorMsg '\%>80v.\+'

"autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
" autocmd CursorMoved  * if pumvisible() == 0|pclose|endif
" autocmd InsertLeave  * if pumvisible() == 0|pclose|endif

"Auto syntax checking
if has('nvim')
  autocmd! BufWritePost * Neomake
  autocmd! BufReadPost * Neomake
  let g:neomake_ruby_enabled_makers = ['rubocop']
else
  let g:syntastic_mode_map = { "mode": "active"}
  let g:syntastic_check_on_open=1
  let g:syntastic_always_populate_loc_list = 1
  let g:syntastic_javascript_checkers = ['eslint']
  let g:syntastic_scss_checkers = ['scss_lint']
  let g:syntastic_ruby_checkers = ['rubocop']
  let g:syntastic_coffee_checkers = ['coffeelint']
  " let g:syntastic_jsx_checkers = ['jsxhint']
  " let g:syntastic_python_checkers = ['flake8']
  " let g:syntastic_python_flake8_post_args='--ignore=E501'
  "let g:syntastic_cpp_checkers = ['cppcheck']
endif


"Easy Motion
nmap S <Plug>(easymotion-s)
nmap s <Plug>(easymotion-s2)
" vmap s <Plug>(easymotion-s2)
nmap t <Plug>(easymotion-t2)
" vmap t <Plug>(easymotion-t2)
" let g:EasyMotion_skipfoldedline = 0
" Gif config
" map  / <Plug>(easymotion-sn)
" omap / <Plug>(easymotion-tn)

" These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
" map  n <Plug>(easymotion-next)
" map  N <Plug>(easymotion-prev)

"YouCompleteMe
" let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
" let g:ycm_key_list_select_completion = ['<Tab>', '<Down>']
"Set to 0 to enable syntastic for cpp
" let g:ycm_show_diagnostics_ui = 1
let g:ycm_semantic_triggers = {
    \   'scss': [ 're!^\s{4}', 're!:\s+' ],
    \   'css' : [ 're!^\s{4}', 're!:\s+' ],
    \   'javascript' : ["require"],
    \   'haskell' : ["."]
\ }
" let g:ycm_path_to_python_interpreter='/usr/local/bin/python3'
" let g:ycm_key_invoke_completion = '<C-Space>'
let g:ycm_min_num_of_chars_for_completion = 1
"autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
"autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" make YCM compatible with UltiSnips (using supertab)
" let g:ycm_key_list_select_completion = ['<Down>']
" let g:ycm_key_list_previous_completion = ['<Up>']
" let g:SuperTabDefaultCompletionType = '<C-n>'

" " better key bindings for UltiSnipsExpandTrigger
" let g:UltiSnipsExpandTrigger = "<CR>"
let g:UltiSnipsExpandTrigger = "<nop>"
inoremap <expr> <CR> pumvisible() ? "<C-R>=UltiSnips#ExpandSnippetOrJump()<CR>" : "\<CR>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
" let g:UltiSnipsJumpBackwardTrigger = "<s-tab>""

"For zsh
set shell=zsh\ -l
" set shell=/bin/bash

"For concealing
" let hscoptions="Bxb-tQZAe"
" augroup AdjustConceal
    " autocmd!
    " autocmd ColorScheme *.hs highlight link Conceal conditional
" augroup END

"Easy tags
" let g:easytags_languages = {
" \   'haskell': {
" \     'cmd': 'hasktags',
" \       'args': ['-c'],
" \       'fileoutput_opt': '-f',
" \       'stdout_opt': '-f-',
" \       'recurse_flag': '-R'
" \   }
" \}
" let g:easytags_async = 1
" set tags=./tags;
" let g:easytags_dynamic_files = 2

"Airline
let g:airline_powerline_fonts = 1

"Pencil
let g:pencil#wrapModeDefault = 'soft'   " default is 'hard'

augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init()
augroup END"

let g:deoplete#enable_at_startup = 1
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif
inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : deoplete#mappings#manual_complete()

"Syntax stuff
" map <leader>S :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
            " \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
            " \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
