set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

Plugin 'scrooloose/syntastic'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'bling/vim-airline'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'Shougo/vimproc.vim'
"Plugin 'mattn/emmet-vim'
Plugin 'rstacruz/sparkup'
Plugin 'flazz/vim-colorschemes'
Plugin 'eagletmt/ghcmod-vim'
"Plugin 'vim-scripts/haskell.vim'
Plugin 'Valloric/YouCompleteMe'
"Plugin 'Shougo/neocomplete.vim'
Plugin 'eagletmt/neco-ghc'
"Plugin 'dag/vim2hs'
Bundle 'christoomey/vim-tmux-navigator'
Plugin 'altercation/vim-colors-solarized'
"Plugin 'enomsg/vim-haskellConcealPlus'
"Plugin 'xolox/vim-easytags'
Plugin 'godlygeek/tabular'
Plugin 'xolox/vim-misc'
Plugin 'vim-scripts/closetag.vim'
"Plugin 'MarcWeber/vim-addon-mw-utils'
"Plugin 'tomtom/tlib_vim'
"Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'ervandew/supertab'
Plugin 'SirVer/ultisnips'
"Plugin 'Rip-Rip/clang_complete'
"Plugin 'qualiabyte/vim-colorstepper'


call vundle#end()            " required
filetype plugin indent on    " required


" Options
let mapleader="\<Space>"
syntax enable
set autochdir
set autoindent
set background=dark
set backspace=indent,eol,start
set visualbell
set ttyfast
set t_vb=
set hidden
set incsearch
set hlsearch
set nowrap
set shiftwidth=4
set softtabstop=4
set expandtab
set ignorecase
set smartcase
set undolevels=1000
set title
set t_Co=256
set formatoptions-=cro
set scrolloff=10
set laststatus=2
set number
set relativenumber
set synmaxcol=180
set gdefault
set guioptions-=r
colorscheme gruvbox

"nnoremap ; :

let $PATH = $PATH . ':' . expand('~/.cabal/bin')

nmap <leader>p :CtrlP<CR>
nmap <leader>n :CtrlPBuffer<CR>
nmap <leader>b :CtrlPTag<CR>
nmap <leader>w :wa<CR>
nmap <leader>q :wqa<CR>
nmap <leader>/ :noh<CR>
autocmd filetype haskell nmap <leader>t :w <bar> GhcModTypeInsert<CR>
autocmd filetype haskell nmap <leader>r :!clear <bar> runhaskell %<CR>
autocmd filetype haskell nmap <leader>h :!hoogle --count=5 ""<Left>
autocmd filetype cpp     nmap <leader>r :!~/.compileRun.py %<CR>
autocmd FileType css     set omnifunc=csscomplete#CompleteCSS
let g:ycm_semantic_triggers = {
    \   'scss': [ 're!^\s{4}', 're!:\s+' ],
    \   'css' : [ 're!^\s{4}', 're!:\s+' ]
\ }

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<Tab>', '<Down>']
let g:ycm_key_list_previous_completion = ['<s-tab>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

"" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<c-y>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

"function! g:UltiSnips_Complete()
    "call UltiSnips#ExpandSnippet()
    "if g:ulti_expand_res == 0
        "if pumvisible()
            "return "\<C-n>"
        "else
            "call UltiSnips#JumpForwards()
            "if g:ulti_jump_forwards_res == 0
               "return "\<TAB>"
            "endif
        "endif
    "endif
    "return ""
"endfunction

"au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
"let g:UltiSnipsJumpForwardTrigger="<tab>"
"let g:UltiSnipsListSnippets="<c-e>"
"" this mapping Enter key to <C-y> to chose the current highlight item 
"" and close the selection list, same as other IDEs.
"" CONFLICT with some plugins like tpope/Endwise
"inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"


func! WordProcessorMode()
    setlocal formatoptions=t1
    setlocal textwidth=80
    map j gj
    map k gk
    setlocal smartindent
    setlocal spell spelllang=en_us
    setlocal noexpandtab
endfu
com! WP call WordProcessorMode()

"nnoremap <silent> <F5> :!clear;python %<CR>

"Enable neocomplete
"let g:neocomplete#enable_at_startup = 1
"let g:neocomplete#enable_smart_case = 1
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"


"Auto syntax checking
let g:syntastic_mode_map = { "mode": "active"}

"YouCompleteMe
"let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_min_num_of_chars_for_completion = 1
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

"For zsh
set shell=zsh\ -l

"For concealing
let hscoptions="Bxb-tQZAe"
augroup AdjustConceal
    autocmd!
    autocmd ColorScheme *.hs highlight link Conceal conditional
augroup END

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
