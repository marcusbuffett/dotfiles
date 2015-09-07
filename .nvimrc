call plug#begin('~/.vim/plugged')
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-fugitive'
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'bling/vim-airline'
Plug 'Lokaltog/vim-easymotion'
Plug 'Shougo/vimproc.vim'
Plug 'mattn/emmet-vim'
Plug 'flazz/vim-colorschemes'
Plug 'eagletmt/ghcmod-vim'
"Plug 'vim-scripts/haskell.vim'
Plug 'Valloric/YouCompleteMe'
Plug 'eagletmt/neco-ghc'
"Plug 'dag/vim2hs'
Plug 'christoomey/vim-tmux-navigator'
" Plug 'altercation/vim-colors-solarized'
"Plug 'enomsg/vim-haskellConcealPlus'
Plug 'xolox/vim-easytags'
Plug 'godlygeek/tabular'
Plug 'ervandew/supertab'
Plug 'xolox/vim-misc'
Plug 'vim-scripts/closetag.vim'
Plug 'honza/vim-snippets'
" Plug 'SirVer/ultisnips'
Plug 'tpope/vim-surround'
"Plug 'qualiabyte/vim-colorstepper'
Plug 'rizzatti/dash.vim'
"Plug 'hallettj/jslint.vim'
Plug 'takac/vim-hardtime'
"Plug 'vim-scripts/vim-auto-save'
"Plug 'vim-scripts/restore_view.vim'
" Plug 'jelera/vim-javascript-syntax'
Plug 'pangloss/vim-javascript'
"Plug 'vim-scripts/JavaScript-Indent'
Plug 'jamescarr/snipmate-nodejs'
Plug 'myhere/vim-nodejs-complete'
Plug 'marijnh/tern_for_vim'
Plug 'Valloric/ListToggle'
Plug 'tpope/vim-abolish'
Plug 'gregsexton/MatchTag'
Plug 'scrooloose/nerdtree'
Plug 'Raimondi/delimitMate'
" Plug 'gregsexton/VimCalc'
Plug 'tpope/vim-repeat'
Plug 'hail2u/vim-css3-syntax'
Plug 'digitaltoad/vim-jade'
Plug 'leafgarland/typescript-vim'
Plug 'dart-lang/dart-vim-plugin'
Plug 'mxw/vim-jsx'
Plug 'reedes/vim-pencil'
Plug 'davidhalter/jedi'
Plug 'altercation/vim-colors-solarized'
Plug 'cakebaker/scss-syntax.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'kchmck/vim-coffee-script'
call plug#end()

" Options
let mapleader="\<Space>"
syntax enable
set autochdir
set autoindent
set smartindent
set background=dark
set backspace=indent,eol,start
set visualbell
set hidden
set incsearch
set nohlsearch
set nowrap
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
set ignorecase
set smartcase
set undolevels=1000
set title
set formatoptions-=cro
set scrolloff=5
set laststatus=2
set number
set relativenumber
set synmaxcol=180
set gdefault
set guioptions-=r
set mouse=a
set timeoutlen=1000 ttimeoutlen=10
set autoread

colorscheme gruvbox

let $PATH = $PATH . ':' . expand('~/.cabal/bin')
 
let g:ctrlp_map = '<leader>p'
nmap <leader><leader>p :CtrlPCurWD<CR>
nmap <Leader>; :%s/\<<C-r><C-w>\>/
nmap <leader>n :CtrlPBuffer<CR>
nmap <leader>b :CtrlPTag<CR>
nmap <leader>w :wa<CR>
nmap <leader>q :wqa<CR>
nmap <leader>/ :noh<CR>
nmap <leader>d :Dash<CR>
nmap <leader>x :pclose<CR>
nmap <tab> :b#<cr>

nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gc :Gcommit<CR>
nnoremap <Leader>gr :Gread<CR>
nnoremap <Leader>gw :Gwrite<CR>
nnoremap <Leader>gp :Gpush<CR>
nnoremap <Leader>gl :Gpush<CR>

map <Leader>e <Plug>(easymotion-prefix)
let g:lt_location_list_toggle_map = '<leader>l'
let g:lt_quickfix_list_toggle_map = '<nop>'
autocmd BufRead,BufNewFile *.jade setlocal ft=jade
" autocmd filetype haskell nmap <leader>t :w <bar> GhcModTypeInsert<CR>
autocmd filetype haskell nmap <leader>r :!runhaskell %<CR>
autocmd filetype haskell nmap <leader>h :!hoogle --count=5 ""<Left>
autocmd filetype javascript nmap <leader>r :!node %<CR>
autocmd filetype javascript nmap <leader>t :TernType<CR>
autocmd filetype javascript nmap <leader>f :TernDef<CR>
autocmd filetype javascript nmap K :TernDoc<CR>
autocmd filetype python setlocal ts=4 sts=4 sw=4
autocmd filetype python  nmap <leader>r :!python3 %<CR>
autocmd filetype php  nmap <leader>r :!php %<CR>
autocmd filetype cpp     nmap <leader>r :wa <bar> !~/.compileRun.py %<CR>
autocmd filetype cpp     nmap <leader>h :wa <bar> !~/.compile.py %<CR>
autocmd filetype haskell setlocal omnifunc=necoghc#omnifunc
autocmd FileType css     set omnifunc=csscomplete#CompleteCSS
autocmd FileType scss     set omnifunc=csscomplete#CompleteCSS
autocmd FileType javascript setlocal omnifunc=tern#Complete

augroup VimCSS3Syntax
  autocmd!
  autocmd FileType css setlocal iskeyword+=-
  autocmd FileType scss setlocal iskeyword+=-
augroup END

"Hardtime
"let g:hardtime_default_on = 1

"NerdTree
map <C-n> :NERDTreeToggle<CR>
" map <C-p> <c-w><c-p>

"NerdCommenter
let NERDSpaceDelims = 1

"CtrlP
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|bower_components\|dist'
let g:ctrlp_working_path_mode = 'ra'

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
let g:syntastic_mode_map = { "mode": "active"}
let g:syntastic_check_on_open=1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_javascript_checkers = ['jshint']
" let g:syntastic_jsx_checkers = ['jsxhint']
" let g:syntastic_python_checkers = ['flake8']
" let g:syntastic_python_flake8_post_args='--ignore=E501'
"let g:syntastic_cpp_checkers = ['cppcheck']


"Easy Motion
nmap s <Plug>(easymotion-s)
vmap s <Plug>(easymotion-s)
let g:EasyMotion_skipfoldedline = 0

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
" let g:UltiSnipsExpandTrigger = "<c-e>"
" let g:UltiSnipsJumpForwardTrigger = "<tab>"
" let g:UltiSnipsJumpBackwardTrigger = "<s-tab>""

"For zsh
set shell=zsh\ -l

"For concealing
" let hscoptions="Bxb-tQZAe"
" augroup AdjustConceal
    " autocmd!
    " autocmd ColorScheme *.hs highlight link Conceal conditional
" augroup END

"Easy tags
let g:easytags_languages = {
\   'haskell': {
\     'cmd': 'hasktags',
\       'args': ['-c'],
\       'fileoutput_opt': '-f',
\       'stdout_opt': '-f-',
\       'recurse_flag': '-R'
\   }
\}
let g:easytags_async = 1

"Airline
let g:airline_powerline_fonts = 1

"Pencil
let g:pencil#wrapModeDefault = 'soft'   " default is 'hard'

augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init()
augroup END"

"Syntax stuff
" map <leader>S :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
            " \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
            " \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
