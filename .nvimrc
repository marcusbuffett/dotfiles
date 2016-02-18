call plug#begin('~/.vim/plugged')
" Plug 'scrooloose/syntastic'
" Plug 'pydave/AsyncCommand'
Plug 'stgpetrovic/syntastic-async'

Plug 'tpope/vim-fugitive'
Plug 'kien/ctrlp.vim'
" Plug 'junegunn/fzf.vim'
" Plug 'mhinz/vim-grepper'
Plug 'scrooloose/nerdcommenter'
Plug 'bling/vim-airline'
" Plug 'Lokaltog/vim-easymotion'
Plug 'Shougo/vimproc.vim'
Plug 'mattn/emmet-vim'
Plug 'flazz/vim-colorschemes'
Plug 'eagletmt/ghcmod-vim'
" Plug 'bitc/vim-hdevtools'
Plug 'Valloric/YouCompleteMe'
" Plug 'eagletmt/neco-ghc'
Plug 'christoomey/vim-tmux-navigator'
" Plug 'xolox/vim-easytags'
Plug 'godlygeek/tabular'
Plug 'xolox/vim-misc'
" Plug 'vim-scripts/closetag.vim'
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-surround'
Plug 'rizzatti/dash.vim'
Plug 'takac/vim-hardtime'
Plug 'pangloss/vim-javascript'
Plug 'jamescarr/snipmate-nodejs'
Plug 'marijnh/tern_for_vim'
Plug 'Valloric/ListToggle'
Plug 'tpope/vim-abolish'
Plug 'gregsexton/MatchTag'
Plug 'scrooloose/nerdtree'
" Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-repeat'
Plug 'hail2u/vim-css3-syntax'
Plug 'digitaltoad/vim-jade'
Plug 'mxw/vim-jsx'
Plug 'reedes/vim-pencil'
Plug 'cakebaker/scss-syntax.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'kchmck/vim-coffee-script'
Plug 'rking/ag.vim'
Plug 'airblade/vim-rooter'
" Plug 'tpope/vim-rails'
" Plug 'yegappan/greplace'
call plug#end()

" Options
let mapleader="\<Space>"
syntax enable
set foldcolumn=1
set autochdir
set autoindent
set noautochdir
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
set noswapfile
" set relativenumber
set synmaxcol=180
set gdefault
set guioptions-=l
set guioptions-=r
set mouse=a
set timeoutlen=1000 ttimeoutlen=10
set autoread
set cpoptions+=d
" let $NVIM_TUI_ENABLE_TRUE_COLOR=1
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

runtime macros/matchit.vim

colorscheme solarized

let $PATH = $PATH . ':' . expand('~/.cabal/bin')
 
let g:ctrlp_map = '<leader>p'
nmap <leader><leader>p :CtrlPCurWD<CR>
nmap <Leader>; :%s/\<<C-r><C-w>\>/
nmap <leader>n :CtrlPBuffer<CR>
nmap <leader>b :CtrlPTag<CR>
nmap <leader>P :CtrlP<CR><C-\>w
nmap <leader>B :CtrlPTag<CR><C-\>w
" vmap <leader>p y:CtrlP<CR><C-\>c
" vmap <leader>b y:CtrlP<CR><C-\>c
nmap <leader>w :wa<CR>
nmap <leader>q :wq<CR>
nmap <leader>/ :noh<CR>
nmap <leader>d :Dash<CR>
nmap <leader>D :Dash 
nmap <leader>x :pclose<CR>:ccl<CR>
" nmap <leader>a :Ag ""<left>
nmap <leader>ag  :Grepper -tool ag  -open -switch -grepprg ag<cr>
nmap <tab> :b#<CR>

noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gd :Gdiff<CR>
noremap <Leader>gb :Gblame<CR>
noremap <Leader>gc :Gcommit<CR>
noremap <Leader>gr :Gread<CR>
noremap <Leader>gw :Gwrite<CR>
noremap <Leader>gp :Gpush<CR>
noremap <Leader>gl :Gpush<CR>
noremap <Leader>go :Gbrowse<CR>
noremap <Leader>gg :Ggrep 

" map <Leader>e <Plug>(easymotion-prefix)
let g:lt_location_list_toggle_map = '<leader>l'
let g:lt_quickfix_list_toggle_map = '<nop>'
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
  au FileType haskell nnoremap <buffer> <leader>t :HdevtoolsType<CR>
  au FileType haskell nnoremap <buffer> <silent> <leader>ct :HdevtoolsClear<CR>
augroup END

augroup VimCSS3Syntax
  autocmd!
  autocmd FileType css setlocal iskeyword+=-
  autocmd FileType scss setlocal iskeyword+=-
augroup END

" Hardtime
let g:hardtime_default_on = 1
let g:hardtime_allow_different_key = 1
let g:list_of_normal_keys = ["h", "j", "k", "l", "-", "+", "<UP>", "<DOWN>", "<LEFT>", "<RIGHT>", "n", "w", "b", "W", "B", "e", "E", ";"]
let g:list_of_visual_keys = ["h", "j", "k", "l", "-", "+", "<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
" let g:list_of_insert_keys = ["<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]

"NerdTree
map <C-n> :NERDTreeToggle<CR>
map <C-f> :NERDTreeFocus<CR>
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
let g:syntastic_mode_map = { "mode": "active"}
let g:syntastic_check_on_open=1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_scss_checkers = ['scss_lint']
let g:syntastic_ruby_checkers = ['rubocop']
" let g:syntastic_jsx_checkers = ['jsxhint']
" let g:syntastic_python_checkers = ['flake8']
" let g:syntastic_python_flake8_post_args='--ignore=E501'
"let g:syntastic_cpp_checkers = ['cppcheck']


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
" set shell=zsh\ -l
set shell=/bin/bash

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

"Syntax stuff
" map <leader>S :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
            " \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
            " \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
