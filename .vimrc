set nocompatible              " be iMproved, required
filetype off                  " required

"Plugins
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"Plugins
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
Plugin 'tpope/vim-surround'
"Plugin 'Rip-Rip/clang_complete'
"Plugin 'qualiabyte/vim-colorstepper'
Plugin 'rizzatti/dash.vim'
"Plugin 'hallettj/jslint.vim'
Plugin 'takac/vim-hardtime'
"Plugin 'vim-scripts/vim-auto-save'
Plugin 'vim-scripts/restore_view.vim'
Plugin 'jelera/vim-javascript-syntax'
"Plugin 'vim-scripts/JavaScript-Indent'
Plugin 'jamescarr/snipmate-nodejs'
Plugin 'myhere/vim-nodejs-complete'
Plugin 'marijnh/tern_for_vim'
Plugin 'Valloric/ListToggle'
Plugin 'tpope/vim-abolish'
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
set nohlsearch
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
set scrolloff=5
set laststatus=2
set number
set relativenumber
set synmaxcol=180
set gdefault
set guioptions-=r
colorscheme gruvbox

let $PATH = $PATH . ':' . expand('~/.cabal/bin')

nmap <leader>p :CtrlP<CR>
nmap <Leader>; :%s/\<<C-r><C-w>\>/
nmap <leader>n :CtrlPBuffer<CR>
nmap <leader>b :CtrlPTag<CR>
nmap <leader>w :wa<CR>
nmap <leader>q :wqa<CR>
nmap <leader>/ :noh<CR>
nmap <leader>d :Dash<CR>
nmap <leader>f :Errors<CR>

map <Leader>e <Plug>(easymotion-prefix)
let g:lt_location_list_toggle_map = '<leader>l'
let g:lt_quickfix_list_toggle_map = '<nop>'
autocmd filetype haskell nmap <leader>t :w <bar> GhcModTypeInsert<CR>
autocmd filetype haskell nmap <leader>r :!clear <bar> runhaskell %<CR>
autocmd filetype haskell nmap <leader>h :!hoogle --count=5 ""<Left>
autocmd filetype javascript nmap <leader>t :TernType<CR>
autocmd filetype javascript setlocal ts=2 sts=2 sw=2
autocmd filetype python  nmap <leader>r :!clear <bar> python %<CR>
autocmd filetype cpp     nmap <leader>r :!~/.compileRun.py %<CR>
autocmd filetype haskell setlocal omnifunc=necoghc#omnifunc
autocmd FileType css     set omnifunc=csscomplete#CompleteCSS

"Hardtime
let g:hardtime_default_on = 1

"CtrlP
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|bower_components'

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


"Auto syntax checking
let g:syntastic_mode_map = { "mode": "active"}
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_javascript_checkers = ['jshint']


"Easy Motion
map s <Plug>(easymotion-s)
let g:EasyMotion_skipfoldedline = 0

"YouCompleteMe
autocmd FileType javascript setlocal omnifunc=tern#Complete
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_key_list_select_completion = ['<Tab>', '<Down>']
"let g:ycm_key_list_previous_completion = ['<s-tab>', '<Up>']
"let g:SuperTabDefaultCompletionType = '<C-n>'
let g:ycm_semantic_triggers = {
    \   'scss': [ 're!^\s{4}', 're!:\s+' ],
    \   'css' : [ 're!^\s{4}', 're!:\s+' ],
    \   'haskell' : ['.', '('],
    \   'javascript' : ["require"]
\ }
let g:ycm_key_invoke_completion = '<C-Space>'
let g:ycm_min_num_of_chars_for_completion = 1
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

let g:UltiSnipsExpandTrigger = "<nop>"
let g:ulti_expand_or_jump_res = 0
function ExpandSnippetOrCarriageReturn()
    let snippet = UltiSnips#ExpandSnippetOrJump()
    if g:ulti_expand_or_jump_res > 0
        return snippet
    else
        return "\<CR>"
    endif
endfunction
inoremap <expr> <CR> pumvisible() ? "<C-R>=ExpandSnippetOrCarriageReturn()<CR>" : "\<CR>"

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
